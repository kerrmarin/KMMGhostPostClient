//
//  KMMGhostTagJSONParser.m
//  Pods
//
//  Created by Kerr Marin Miller on 20/07/2015.
//
//

#import "KMMGhostTagJSONParser.h"
#import "KMMGhostTag.h"

static NSUInteger KMMGhostTagParserErrorInvalidObjectCode = 100;

@interface KMMGhostTagJSONParser ()

@property (nonatomic, readonly) NSDateFormatter *dateFormatter;

@end

@implementation KMMGhostTagJSONParser

-(instancetype)init {
    if (self = [super init]) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        _dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    }
    return self;
}

-(nullable KMMGhostTag *)parseTagFromResponse:(NSDictionary *)response error:(NSError **)error {
    if(![response isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSNumber *tagIdNumber = response[@"id"];
    NSString *tagUUID = response[@"uuid"];
    NSString *name = response[@"name"];
    NSString *slug = response[@"slug"];
    NSDate *createdAt = [self.dateFormatter dateFromString:response[@"created_at"]];
    NSDate *updatedAt = [self.dateFormatter dateFromString:response[@"updated_at"]];
    NSNumber *createdByNumber = response[@"created_by"];
    NSNumber *updatedByNumber = response[@"updated_by"];
    
    if (![tagUUID isKindOfClass:[NSString class]] ||
        ![name isKindOfClass:[NSString class]] ||
        ![slug isKindOfClass:[NSString class]] ||
        ![createdAt isKindOfClass:[NSDate class]] ||
        ![updatedAt isKindOfClass:[NSDate class]] ||
        ![tagIdNumber isKindOfClass:[NSNumber class]] ||
        ![createdByNumber isKindOfClass:[NSNumber class]] ||
        ![updatedByNumber isKindOfClass:[NSNumber class]]) {
        *error = [NSError errorWithDomain:@"com.kerrmarin.ghost.tag.parser"
                                     code:KMMGhostTagParserErrorInvalidObjectCode
                                 userInfo:@{NSLocalizedFailureReasonErrorKey: @"Invalid JSON for KMMGhostTag"}];
        return nil;
    }
    
    NSUInteger tagId = tagIdNumber.unsignedIntegerValue;
    NSUInteger createdBy = createdByNumber.unsignedIntegerValue;
    NSUInteger updatedBy = updatedByNumber.unsignedIntegerValue;

    KMMGhostTag *tag = [[KMMGhostTag alloc] initWithtagId:tagId
                                                  tagUUID:tagUUID
                                                     name:name
                                                     slug:slug
                                                createdAt:createdAt
                                                createdBy:createdBy
                                                updatedAt:updatedAt
                                                updatedBy:updatedBy];
    return tag;
}

@end
