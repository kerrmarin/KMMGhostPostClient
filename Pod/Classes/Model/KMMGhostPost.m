//
//  KMMGhostPost.m
//  Pods
//
//  Created by Kerr Marin Miller on 11/07/2015.
//
//

#import "KMMGhostPost.h"

@implementation KMMGhostPost

-(nullable instancetype)initWithPostId:(NSInteger)postId
                              postUUID:(NSString *)postUUID
                                 title:(NSString *)title
                                  slug:(NSString *)slug
                                status:(KMMGhostPostStatus)status
                              markdown:(NSString *)markdown
                                  html:(NSString *)html
                            isFeatured:(BOOL)featured
                                isPage:(BOOL)page
                                locale:(NSLocale *)locale
                              authorId:(NSInteger)authorId
                             createdAt:(NSDate *)createdAt
                             createdBy:(NSInteger)createdBy
                             updatedAt:(NSDate *)updatedAt
                             updatedBy:(NSInteger)updatedBy
                           publishedAt:(NSDate *)publishedAt
                           publishedBy:(NSInteger)publishedBy
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

@end
