//
//  KMMPostsViewController.m
//  GhostPostClient
//
//  Created by Kerr Marin Miller on 27/09/2015.
//  Copyright © 2015 Kerr Marin Miller. All rights reserved.
//

#import "KMMPostsViewController.h"
#import "KMMGhostPostClient.h"
#import "KMMPostViewController.h"
#import "KMMGhostPost.h"

@interface KMMPostsViewController () <UITableViewDataSource>

@property(nonatomic) KMMGhostPostClient *client;
@property(nonatomic, weak) IBOutlet UITableView *tableView;

@property(nonatomic, copy) NSArray<KMMGhostPost *> *posts;

@end

@implementation KMMPostsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.client = [KMMGhostPostClient defaultClient];
    [self.client initializeWithUrl:self.blogBaseURL];
    [self.client setAccessToken:self.accessToken];
    [self.client getAllPostsWithBlock:^(NSArray * _Nullable results, NSError * _Nullable error) {
        self.posts = results;
        [self.tableView reloadData];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"postCell" forIndexPath:indexPath];
    KMMGhostPost *post = self.posts[indexPath.row];
    cell.textLabel.text = post.title;
    cell.detailTextLabel.text = post.status == KMMGhostPostStatusDraft ? @"Draft" : @"Published";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showPost"]) {
        UITableViewCell *cell = sender;
        NSIndexPath *path = [self.tableView indexPathForCell:cell];
        KMMGhostPost *post = self.posts[path.row];
        KMMPostViewController *destination = segue.destinationViewController;
        destination.post = post;
    }
}

@end
