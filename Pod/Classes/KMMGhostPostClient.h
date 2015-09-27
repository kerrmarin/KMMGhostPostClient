//
//  KMMGhostPostClient.h
//  Pods
//
//  Created by Kerr Marin Miller on 26/09/2015.
//
//

@import Foundation;

@class KMMGhostPost;

NS_ASSUME_NONNULL_BEGIN

@interface KMMGhostPostClient : NSObject

+ (instancetype)defaultClient;

- (void)initializeWithUrl:(NSURL*)url;

- (void)setAccessToken:(NSString *)accessToken;

/**
 * Retrieves all posts for the current logged-in account
 */
- (void)getAllPostsWithBlock:(void (^)(NSArray * __nullable results, NSError *__nullable error))complete;

/**
 *  <#Description#>
 *
 *  @param post     <#post description#>
 *  @param complete <#complete description#>
 *
 *  @return <#return value description#>
 */
- (void)createPost:(KMMGhostPost *)post complete:(void (^)(BOOL success, NSError *__nullable error))complete;

/**
 *  <#Description#>
 *
 *  @param postId   <#postId description#>
 *  @param complete <#complete description#>
 *
 *  @return <#return value description#>
 */
- (void)getPostWithId:(NSUInteger)postId complete:(void (^)(KMMGhostPost * __nullable post, NSError *__nullable error))complete;

/**
 *  <#Description#>
 *
 *  @param postId   <#postId description#>
 *  @param complete <#complete description#>
 *
 *  @return <#return value description#>
 */
- (void)updatePost:(KMMGhostPost *)post complete:(void (^)(BOOL success, NSError *__nullable error))complete;

/**
 *  <#Description#>
 *
 *  @param postId   <#postId description#>
 *  @param complete <#complete description#>
 *
 *  @return <#return value description#>
 */
- (void)deletePostWithId:(NSUInteger)postId complete:(void (^)(BOOL success, NSError *__nullable error))complete;


@end

NS_ASSUME_NONNULL_END
