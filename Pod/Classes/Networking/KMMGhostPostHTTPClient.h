//
//  KMMGhostPostHTTPClient.h
//  Pods
//
//  Created by Kerr Marin Miller on 20/07/2015.
//
//

@import Foundation;
@class KMMGhostPost;

NS_ASSUME_NONNULL_BEGIN

typedef void (^KMMGhostPostNetworkBlock)(id __nullable results, NSError *__nullable error);

@protocol KMMGhostPostHTTPClient <NSObject>

/**
 *  Gets all posts available for the logged in user
 *
 *  @param complete the block that will be called on completion of the network request
 *
 *  @return the data task that manages the session for this request
 */
-(NSURLSessionDataTask *)getAllPostsWithBlock:(KMMGhostPostNetworkBlock)complete;

/**
 *  Creates a new post in the user's blog
 *
 *  @param post     the post to be created
 *  @param complete  the block that will be called on completion of the network request
 *
 *  @return the data task that manages the session for this request
 */
-(NSURLSessionDataTask *)createPost:(KMMGhostPost *)post complete:(KMMGhostPostNetworkBlock)complete;

/**
 *  Gets a post by ID
 *
 *  @param postId   the id of the post to be retrieved
 *  @param complete  the block that will be called on completion of the network request
 *
 *  @return the data task that manages the session for this request
 */
-(NSURLSessionDataTask *)getPostWithId:(NSUInteger)postId complete:(KMMGhostPostNetworkBlock)complete;

/**
 *  Updates a post with the given post
 *
 *  @param post      the post that will be updated. This post's ID is used in the URL and the contents of the post object
 *                   are then used to update the fields of the post.
 *  @param complete  the block that will be called on completion of the network request
 *
 *  @return the data task that manages the session for this request
 */
-(NSURLSessionDataTask *)updatePost:(KMMGhostPost *)post complete:(KMMGhostPostNetworkBlock)complete;

/**
 *  Deletes the post with the given post ID
 *
 *  @param postId   the ID of the post to be deleted
 *  @param complete  the block that will be called on completion of the network request
 *
 *  @return the data task that manages the session for this request
 */
-(NSURLSessionDataTask *)deletePostWithId:(NSUInteger)postId complete:(KMMGhostPostNetworkBlock)complete;


@end

NS_ASSUME_NONNULL_END
