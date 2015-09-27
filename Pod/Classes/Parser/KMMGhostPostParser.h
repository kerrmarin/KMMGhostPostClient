//
//  KMMGhostPostParser.h
//  Pods
//
//  Created by Kerr Marin Miller on 11/07/2015.
//
//

@import Foundation;
@class KMMGhostPost;

NS_ASSUME_NONNULL_BEGIN

@protocol KMMGhostPostParser <NSObject>

-(nullable KMMGhostPost*)parsePostFromResponse:(id)response error:(NSError**)error;

@end

NS_ASSUME_NONNULL_END