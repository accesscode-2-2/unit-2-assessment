//
//  U2ATableViewController.m
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>

#import "U2ATableViewController.h"
#import "U2ACustomTableViewCell.h"

#define APIKEY @"8040fc5b15adaaafabbe7de9c3ff5458"



@interface U2ATableViewController ()

@end

@implementation U2ATableViewController

- (void)fetchWeatherForecastAPIData {
    
    // manages API requests
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    [manager GET:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.745703,-73.947009"
      parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             
             NSLog(@"%@", responseObject);
             //             NSDictionary *pages = responseObject[@"query"][@"pages"];
             //             NSDictionary *firstPage;
             //             for (NSDictionary *page in pages) {
             //                 firstPage = pages[page];
             //                 break;
             //             }
             //             NSLog(@"%@", firstPage);
             
         } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
             
             NSLog(@"%@", error);
         }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchWeatherForecastAPIData];
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(pulledToRefresh:) forControlEvents:UIControlEventValueChanged];
    
    // tell the table view to auto adjust the height of each cell
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //self.tableView.estimatedRowHeight = 44.0;
    
    UINib *nib = [UINib nibWithNibName:@"U2ACustomTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TableVCCellIdentifier"];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self fetchWeatherForecastAPIData];
    
}

- (void)pulledToRefresh:(UIRefreshControl *)sender {
    [self fetchWeatherForecastAPIData];
    [sender endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableVCCellIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    //InstagramPost *post = self.searchResults[indexPath.section];
    
//    cell.userNameLabel.text = [NSString stringWithFormat:@"@%@", post.username];
//    cell.likeCountLabel.text = [NSString stringWithFormat:@"Likes: %ld", post.likeCount];
//    cell.tagCountLabel.text = [NSString stringWithFormat:@"Tags: %ld", post.tags.count];
//    cell.captionLabel.text = post.caption[@"text"];
//    
//    NSURL *url = [NSURL URLWithString:post.imageUrl];
//    //NSData *data = [NSData dataWithContentsOfURL:url];
//    //UIImage *image = [UIImage imageWithData:data];
//    //cell.userMediaImageView.image = image;
//    
//    [cell.userMediaImageView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        
//        cell.userMediaImageView.image = image;
//    }];
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
