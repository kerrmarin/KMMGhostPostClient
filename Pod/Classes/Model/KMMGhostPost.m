//
//  KMMGhostPost.m
//  Pods
//
//  Created by Kerr Marin Miller on 11/07/2015.
//
//

#import "KMMGhostPost.h"

@implementation KMMGhostPost

-(nullable instancetype)initWithPostId:(NSUInteger)postId
                              postUUID:(NSString *)postUUID
                                 title:(NSString *)title
                                  slug:(NSString *)slug
                                status:(KMMGhostPostStatus)status
                              markdown:(NSString *)markdown
                                  html:(NSString *)html
                            isFeatured:(BOOL)featured
                                isPage:(BOOL)page
                                locale:(NSLocale *)locale
                              authorId:(NSUInteger)authorId
                             createdAt:(NSDate *)createdAt
                             createdBy:(NSUInteger)createdBy
                             updatedAt:(NSDate *)updatedAt
                             updatedBy:(NSUInteger)updatedBy
                           publishedAt:(NSDate *)publishedAt
                           publishedBy:(NSUInteger)publishedBy
                                  tags:(NSArray *)tags {
    
    if(self = [super init]) {
        _postId = postId;
        _postUUID = [postUUID copy];
        _slug = [slug copy];
        _title = [title copy];
        _status = status;
        _markdown = [markdown copy];
        _html = [html copy];
        _featured = featured;
        _page = page;
        _locale = locale;
        _authorId = authorId;
        _createdAt = createdAt;
        _createdBy = createdBy;
        _updatedAt = updatedAt;
        _updatedBy = updatedBy;
        _publishedAt = publishedAt;
        _publishedBy = publishedBy;
        _tags = [tags copy];
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title markdown:(NSString *)markdown {
    if(self = [super init]) {
        _title = [title copy];
        _markdown = [markdown copy];
    }
    return self;
}

@end
