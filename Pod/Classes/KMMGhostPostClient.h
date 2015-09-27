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

/**
 * Gets the default client
 */
+ (instancetype)defaultClient;

/*
 * Initializes the internal client with a given base URL and access token
 */
- (void)initializeWithUrl:(NSURL*)url accessToken:(NSString *)accessToken;

/*
 * Sets the access token. This is usually used for refreshing the token when it has expired.
 */
- (void)setAccessToken:(NSString *)accessToken;

/**
 * Retrieves all posts for the current logged-in account
 */
- (void)getAllPostsWithBlock:(void (^)(NSArray * __nullable results, NSError *__nullable error))complete;

/**
 *  Creates a new post whose author is the current logged in user
 *
 *  @param post     The post object that should be created
 *  @param complete A block that will be called when a response is received
 *
 */
- (void)createPost:(KMMGhostPost *)post complete:(void (^)(BOOL success, NSError *__nullable error))complete;

/**
 *  Gets a post based on that post's ID
 *
 *  @param postId   the ID of the post to retrieve
 *  @param complete a block that will be called when the response is received. 
 *   If a post was found, it will be passed in this block.
 *
 */
- (void)getPostWithId:(NSUInteger)postId complete:(void (^)(KMMGhostPost * __nullable post, NSError *__nullable error))complete;

/**
 *  Updates a post with a given post
 *
 *  @param post the post to update. This will update the post based on the
 *   post ID and replace all properties with those of the given post.
 *  @param complete the block called when a response is received. 
 *    success will be YES if the update was successful.
 *
 */
- (void)updatePost:(KMMGhostPost *)post complete:(void (^)(BOOL success, NSError *__nullable error))complete;

/**
 *  Deletes a post based on the given ID.
 *
 *  @param postId   the ID of the post to delete
 *  @param complete a block called when a response is received.
 *
 */
- (void)deletePostWithId:(NSUInteger)postId complete:(void (^)(BOOL success, NSError *__nullable error))complete;

@end

NS_ASSUME_NONNULL_END
