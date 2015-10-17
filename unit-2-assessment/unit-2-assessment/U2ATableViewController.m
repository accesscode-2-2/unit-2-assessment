//
//  U2ATableViewController.m
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>

#import "U2ATableViewController.h"

#define APIKEY @"8040fc5b15adaaafabbe7de9c3ff5458"



@interface U2ATableViewController ()

@end

@implementation U2ATableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
