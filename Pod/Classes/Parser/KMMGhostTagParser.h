//
//  KMMGhostTagParser.h
//  Pods
//
//  Created by Kerr Marin Miller on 11/07/2015.
//
//

@import Foundation;
@class KMMGhostTag;

NS_ASSUME_NONNULL_BEGIN

@protocol KMMGhostTagParser <NSObject>

-(nullable KMMGhostTag*)parseTagFromResponse:(id)response error:(NSError**)error;

@end

NS_ASSUME_NONNULL_END
