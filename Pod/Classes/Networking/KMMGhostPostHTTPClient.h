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
 *  <#Description#>
 *
 *  @param complete <#complete description#>
 *
 *  @return <#return value description#>
 */
-(NSURLSessionDataTask *)getAllPostsWithBlock:(KMMGhostPostNetworkBlock)complete;

/**
 *  <#Description#>
 *
 *  @param post     <#post description#>
 *  @param complete <#complete description#>
 *
 *  @return <#return value description#>
 */
-(NSURLSessionDataTask *)createPost:(KMMGhostPost *)post complete:(KMMGhostPostNetworkBlock)complete;

/**
 *  <#Description#>
 *
 *  @param postId   <#postId description#>
 *  @param complete <#complete description#>
 *
 *  @return <#return value description#>
 */
-(NSURLSessionDataTask *)getPostWithId:(NSUInteger)postId complete:(KMMGhostPostNetworkBlock)complete;

/**
 *  <#Description#>
 *
 *  @param postId   <#postId description#>
 *  @param complete <#complete description#>
 *
 *  @return <#return value description#>
 */
-(NSURLSessionDataTask *)updatePost:(KMMGhostPost *)post complete:(KMMGhostPostNetworkBlock)complete;

/**
 *  <#Description#>
 *
 *  @param postId   <#postId description#>
 *  @param complete <#complete description#>
 *
 *  @return <#return value description#>
 */
-(NSURLSessionDataTask *)deletePostWithId:(NSUInteger)postId complete:(KMMGhostPostNetworkBlock)complete;


@end

NS_ASSUME_NONNULL_END
