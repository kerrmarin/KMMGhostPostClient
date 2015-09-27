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
 *  Designated initializer for this JSON client. Uses an instance of AFHTTPSessionManager to perform the actual network communication.
 *
 *  @param sessionManager The session manager that will handle the network connections
 *
 *  @return an instance of @c KMMGhostPostHTTPJSONClient
 */
-(instancetype)initWithSessionManager:(AFHTTPSessionManager*)sessionManager NS_DESIGNATED_INITIALIZER;

/*
 * The access token that will be used to authenticate with the API
 */
@property(nonatomic, copy) NSString *accessToken;

@end

NS_ASSUME_NONNULL_END
