//
//  KMMGhostPostHTTPJSONClient.h
//  Pods
//
//  Created by Kerr Marin Miller on 20/07/2015.
//
//

@import Foundation;
#import "KMMGhostPostHTTPClient.h"
#import <AFNetworking/AFNetworking.h>


NS_ASSUME_NONNULL_BEGIN

@interface KMMGhostPostHTTPJSONClient : NSObject <KMMGhostPostHTTPClient>

- (instancetype)init NS_UNAVAILABLE;

/**
 *  <#Description#>
 *
 *  @param sessionManager <#url description#>
 *
 *  @return <#return value description#>
 */
-(instancetype)initWithSessionManager:(AFHTTPSessionManager*)sessionManager NS_DESIGNATED_INITIALIZER;

@property(nonatomic, copy) NSString *accessToken;

@end

NS_ASSUME_NONNULL_END
