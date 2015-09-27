//
//  KMMGhostTag.h
//  Pods
//
//  Created by Kerr Marin Miller on 11/07/2015.
//
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface KMMGhostTag : NSObject

/**
 *  the ID created by the server, increments
 */
@property(nonatomic, readonly) NSInteger tagId;

/**
 *  Unique identifier generated automatically as UUIDv4.
 */
@property(nonatomic, readonly, copy) NSString *tagUUID;

/**
 *  Name of the tag.
 */
@property(nonatomic, readonly, copy) NSString *name;

/**
 *  Automatically generated unique slug that is based on the name of your tag
 *  (e.g.: 'Test Tag' will become 'test-tag').
 */
@property(nonatomic, readonly, copy) NSString *slug;

/**
 *  The date this tag was created at
 */
@property(nonatomic, readonly) NSDate *createdAt;

/**
 *  the id of the user that created this tag
 */
@property(nonatomic, readonly) NSInteger createdBy;

/**
 *  the date at which this tag was last updated
 */
@property(nonatomic, readonly) NSDate *updatedAt;

/**
 *  the id of the last user to update this tag
 */
@property(nonatomic, readonly) NSInteger updatedBy;


-(nullable instancetype)initWithtagId:(NSInteger)tagId
                              tagUUID:(NSString *)tagUUID
                                 name:(NSString *)name
                                 slug:(NSString *)slug
                            createdAt:(NSDate *)createdAt
                            createdBy:(NSInteger)createdBy
                            updatedAt:(NSDate *)updatedAt
                            updatedBy:(NSInteger)updatedBy;

@end


NS_ASSUME_NONNULL_END
