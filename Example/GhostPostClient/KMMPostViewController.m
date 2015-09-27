//
//  KMMPostViewController.m
//  GhostPostClient
//
//  Created by Kerr Marin Miller on 27/09/2015.
//  Copyright © 2015 Kerr Marin Miller. All rights reserved.
//

#import "KMMPostViewController.h"

#import "KMMGhostPost.h"

@interface KMMPostViewController ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITextView *bodyTextView;

@end

@implementation KMMPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = self.post.title;
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[self.post.html dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    self.bodyTextView.attributedText = attributedString;
}



@end
