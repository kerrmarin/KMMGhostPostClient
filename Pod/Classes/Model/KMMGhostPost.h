//
//  KMMGhostPost.h
//  Pods
//
//  Created by Kerr Marin Miller on 11/07/2015.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, KMMGhostPostStatus) {
    KMMGhostPostStatusDraft = 0,
    KMMGhostPostStatusPublished
};

@interface KMMGhostPost : NSObject

/**
 *  id: integer
 */
@property(nonatomic, readonly) NSUInteger postId;

/**
 *  Unique identifier generated automatically as UUIDv4.
 */
@property(nonatomic, readonly, copy) NSString *postUUID;

/**
 *  Title of your blog post.
 */
@property(nonatomic, copy) NSString *title;

/**
 *  Automatically generated unique slug that is based on the title of
 *  your blog post (e.g.: 'Test Post' will become 'test-post').
 */
@property(nonatomic, readonly, copy) NSString *slug;

/**
 *  Possible values are KMMGhostPostStatusDraft and KMMGhostPostStatusPublished.
 *  status has influence on who can see your post and if it is shown on the frontpage of your blog.
 *  Defaults to KMMGhostPostStatusDraft.
 */
@property(nonatomic, readonly) KMMGhostPostStatus status;

/**
 *  Markdown of your post.
 */
@property(nonatomic, copy) NSString *markdown;

/**
 *  HTML of your post generated from markdown.
 */
@property(nonatomic, readonly, copy) NSString *html;

/**
 *  Indicate a featured post. Defaults to false.
 */
@property(nonatomic, readonly, getter=isFeatured) BOOL featured;

/**
 *  Indicate if the post is a page. Defaults to false.
 */
@property(nonatomic, readonly, getter=isPage) BOOL page;

/**
 *  Language of the post. Not currently used. Defaults to en_US.
 *  Language codes used as primary subtags are from ISO 639-1.
 *  Country codes used as secondary subtags are from ISO 3166.
 *  Primary and secondary tag are concatenated with an underscore.
 */
@property(nonatomic, readonly) NSLocale *locale;

/**
 *  Author of the post. By default the creator is used as initial author.
 */
@property(nonatomic, readonly) NSUInteger authorId;

/**
 *  ISO 8601 date and time when the post was created.
 */
@property(nonatomic, readonly) NSDate *createdAt; // ISO 8601

/**
 *  User who created the post.
 */
@property(nonatomic, readonly) NSUInteger createdBy;

/**
 *  ISO 8601 date and time when the post was last updated.
 */
@property(nonatomic, readonly) NSDate *updatedAt; // ISO 8601

/**
 *  User who last updated the post
 */
@property(nonatomic, readonly) NSUInteger updatedBy;

/**
 *  ISO 8601 date and time when the post was published.
 */
@property(nullable, nonatomic, readonly) NSDate *publishedAt; // ISO 8601

/**
 *  User who published the post
 */
@property(nonatomic, readonly) NSUInteger publishedBy;

/**
 *  Tags associated with the post.
 */
@property(nonatomic, readonly, copy) NSArray *tags;


- (instancetype)init NS_UNAVAILABLE;

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
                           publishedAt:(nullable NSDate *)publishedAt
                           publishedBy:(NSUInteger)publishedBy
                                  tags:(NSArray *)tags NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
