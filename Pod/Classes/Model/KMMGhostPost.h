//
//  KMMGhostPost.h
//  Pods
//
//  Created by Kerr Marin Miller on 11/07/2015.
//
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
@property(nonatomic, readonly) NSInteger postId;

/**
 *  Unique identifier generated automatically as UUIDv4.
 */
@property(nonatomic, readonly, copy) NSString *postUUID;

/**
 *  Title of your blog post.
 */
@property(nonatomic, readonly, copy) NSString *title;

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
@property(nonatomic, readonly, copy) NSString *markdown;

/**
 *  HTML of your post generated from markdown.
 */
@property(nonatomic, readonly, copy) NSString *html;

/**
 *  Not currently used.
 */
@property(nonatomic, readonly, copy) NSString *image;

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
 *  Not currently used.
 */
@property(nonatomic, readonly, copy) NSString *metaTitle;

/**
 *  Not currently used.
 */
@property(nonatomic, readonly, copy) NSString *metaDescription;

/**
 *  Author of the post. By default the creator is used as initial author.
 */
@property(nonatomic, readonly) NSInteger authorId;

/**
 *  ISO 8601 date and time when the post was created.
 */
@property(nonatomic, readonly) NSDate *createdAt; // ISO 8601

/**
 *  User who created the post.
 */
@property(nonatomic, readonly) NSInteger createdBy;

/**
 *  ISO 8601 date and time when the post was last updated.
 */
@property(nonatomic, readonly) NSDate *updatedAt; // ISO 8601

/**
 *  User who last updated the post
 */
@property(nonatomic, readonly) NSInteger updatedBy;

/**
 *  ISO 8601 date and time when the post was published.
 */
@property(nonatomic, readonly) NSDate *publishedAt; // ISO 8601

/**
 *  User who published the post
 */
@property(nonatomic, readonly) NSInteger publishedBy;

/**
 *  Tags associated with the post.
 */
@property(nonatomic, readonly, copy) NSArray *tags;


-(instancetype)initWithPostId:(NSInteger)postId
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
                         tags:(NSArray *)tags;

@end

NS_ASSUME_NONNULL_END
