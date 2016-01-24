//
//  KMMGhostPostJSONParser.m
//  Pods
//
//  Created by Kerr Marin Miller on 19/07/2015.
//
//

#import "KMMGhostPostJSONParser.h"
#import "KMMGhostTagJSONParser.h"

#import "KMMGhostPost.h"
#import "KMMGhostTag.h"

static NSUInteger KMMGhostPostParserErrorInvalidObjectCode = 100;

@interface KMMGhostPostJSONParser ()

@property (nonatomic, readonly) NSDateFormatter *dateFormatter;

@end

@implementation KMMGhostPostJSONParser

- (instancetype)init {
    if(self = [super init]) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    }
    return self;
}

-(nullable KMMGhostPost *)parsePostFromResponse:(NSDictionary *)response error:(NSError **)error {
    NSString *status = response[@"status"];
    NSNumber *postIdNumber = response[@"id"];
    NSString *uuid = response[@"uuid"];
    NSString *title = response[@"title"];
    NSString *slug = response[@"slug"];
    NSString *markdown = response[@"markdown"];
    NSString *html = response[@"html"];
    NSString *imagePath = response[@"image"];
    BOOL featured = [response[@"featured"] boolValue];
    BOOL page = [response[@"featured"] boolValue];
    NSString *localeIdentifier = response[@"language"];
    NSNumber *authorNumber = response[@"author"];
    
    NSString *createdAt = response[@"created_at"];
    NSString *updatedAt = response[@"updated_at"];
    NSNumber *createdByNumber = response[@"created_by"];
    NSNumber *updatedByNumber = response[@"updated_by"];
    
    NSString *publishedAt = response[@"published_at"];
    
    NSUInteger publishedBy;
    if ([response[@"published_by"] isKindOfClass:[NSNumber class]]) {
        publishedBy = [response[@"published_by"] unsignedIntegerValue];
    }
    
    NSDate *createdAtDate = [self.dateFormatter dateFromString:createdAt];
    NSDate *updatedAtDate = [self.dateFormatter dateFromString:updatedAt];
    
    if(![status isKindOfClass:[NSString class]] ||
       ![uuid isKindOfClass:[NSString class]] ||
       ![title isKindOfClass:[NSString class]] ||
       ![slug isKindOfClass:[NSString class]] ||
       ![markdown isKindOfClass:[NSString class]] ||
       ![html isKindOfClass:[NSString class]] ||
       ![localeIdentifier isKindOfClass:[NSString class]] ||
       ![postIdNumber isKindOfClass:[NSNumber class]] ||
       ![authorNumber isKindOfClass:[NSNumber class]] ||
       ![createdByNumber isKindOfClass:[NSNumber class]] ||
       ![updatedByNumber isKindOfClass:[NSNumber class]] ||
       !createdAtDate ||
       !updatedAtDate) {
        *error = [NSError errorWithDomain:@"com.kerrmarin.ghost.post.parser"
                                     code:KMMGhostPostParserErrorInvalidObjectCode
                                 userInfo:@{NSLocalizedFailureReasonErrorKey: @"Invalid JSON for KMMGhostPost"}];
        return nil;
    }
    
    if ([imagePath isKindOfClass:[NSNull class]]) {
        imagePath = nil;
    }
    
    if (imagePath && ![imagePath isKindOfClass:[NSString class]]) {
        return nil;
    }
    
    NSUInteger postId = [postIdNumber unsignedIntegerValue];
    NSUInteger author = [authorNumber unsignedIntegerValue];
    NSUInteger createdBy = [createdByNumber unsignedIntegerValue];
    NSUInteger updatedBy = [updatedByNumber unsignedIntegerValue];
    
    KMMGhostPostStatus postStatus = [status isEqualToString:@"published"] ? KMMGhostPostStatusPublished : KMMGhostPostStatusDraft;
    
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:localeIdentifier];
    
    NSArray *tags = [self parseTagsFromResponse:response[@"tags"]];
    
    NSDate *publishedAtDate;
    if([publishedAt isKindOfClass:[NSString class]]) {
        publishedAtDate = [self.dateFormatter dateFromString:publishedAt];
    }
    
    KMMGhostPost *post = [[KMMGhostPost alloc] initWithPostId:postId
                                                     postUUID:uuid
                                                        title:title
                                                         slug:slug
                                                       status:postStatus
                                                     markdown:markdown
                                                         html:html
                                                   isFeatured:featured
                                                       isPage:page
                                                       locale:locale
                                                     authorId:author
                                                    createdAt:createdAtDate
                                                    createdBy:createdBy
                                                    updatedAt:updatedAtDate
                                                    updatedBy:updatedBy
                                                  publishedAt:publishedAtDate
                                                  publishedBy:publishedBy
                                                         tags:tags
                                                    imagePath:imagePath];

    return post;
}

- (NSArray *)parseTagsFromResponse:(NSArray *)tagsResponse {
    NSMutableArray *tagObjects = [NSMutableArray arrayWithCapacity:tagsResponse.count];
    KMMGhostTagJSONParser *tagParser = [[KMMGhostTagJSONParser alloc] init];
    for(NSDictionary *tagDictionary in tagsResponse) {
        NSError *tagError = nil;
        KMMGhostTag *tag = [tagParser parseTagFromResponse:tagDictionary error:&tagError];
        if(tag) {
            [tagObjects addObject:tag];
        }
    }
    return tagObjects;
}

@end
