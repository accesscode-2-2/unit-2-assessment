//
//  WeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Umar on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherTableViewController.h"
#import "AFNetworking.h"
#import "WeatherData.h"
#import "CustomTableViewCell.h"
#import "DetailViewController.h"

@interface WeatherTableViewController ()  <UITableViewDataSource>

@property (nonatomic) NSMutableArray *resultsArray;
//@property (nonatomic) NSMutableArray *timeArray;
@property (nonatomic) NSMutableArray *imageArray;
@property (nonatomic) NSMutableArray *rangeArray;
//@property (nonatomic) NSDictionary *json;

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    [manager GET:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/24,76" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *json = (NSDictionary *) responseObject;

        
//                NSLog(@"JSON: %@", json);
        
        
        
//        NSLog(@"%@", [json objectForKey:@"daily"][@"data"]);
        
//        NSLog(@"%@", [json objectForKey:@"data"][@"time"]);
        
        


        
                NSArray *results = [json objectForKey:@"daily"][@"data"];
        
        
//
                self.resultsArray = [[NSMutableArray alloc] init];
//
                for (NSDictionary *result in results) {
                
                    WeatherData *leftLabelObj = [[WeatherData alloc]init];
                    
                    leftLabelObj.time = [result objectForKey:@"time"];
                    
                    NSLog(@"%@", leftLabelObj.time);
                    
                    [self.resultsArray addObject:leftLabelObj];


                }
        
        self.rangeArray = [[NSMutableArray alloc] init];

        
        for (NSDictionary *resultTwo in results) {
            
            WeatherData *rightRangeLabel = [[WeatherData alloc]init];
            
            rightRangeLabel.maxTemp = [resultTwo objectForKey:@"temperatureMin"];
            
            NSLog(@"%@", rightRangeLabel.maxTemp);
            
            [self.rangeArray addObject:rightRangeLabel];
            
            
        }
        
        self.imageArray = [[NSMutableArray alloc] init];

        
        for (NSDictionary *resultThree in results) {
            
            WeatherData *weatherImageView = [[WeatherData alloc]init];
            
            weatherImageView.weatherImage = [resultThree objectForKey:@"icon"];
            
            NSLog(@"%@", weatherImageView.weatherImage);
            
            [self.imageArray addObject:weatherImageView];
            
            
        }
        
        
        
        [self.tableView reloadData];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.resultsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    WeatherData * result = [self.resultsArray objectAtIndex:indexPath.row];
    WeatherData * resultTwo = [self.rangeArray objectAtIndex:indexPath.row];
    WeatherData * resultThree = [self.imageArray objectAtIndex:indexPath.row];
    
    NSString *string = [NSString stringWithFormat:@"%@", result.time];
    NSString *stringTwo = [NSString stringWithFormat:@"%@",resultTwo.maxTemp];

    customCell.leftTimeLabel.text = string;
    customCell.rightRangeLabel.text = stringTwo;
//    customCell.weatherImageView.image = [resultThree imageNamed: resultThree.string];
    
    NSString *imageName = resultThree.weatherImage;
    customCell.imageView.image = [UIImage imageNamed:imageName];

    return customCell;
}
//
//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    
//    NSIndexPath *indexpath = [self.tableView indexPathForSelectedRow];
//    
//    NSDictionary *dictionaryToPass = [self.json objectForKey:@"daily"][@"data"];
//    
//    NSLog(@"%@", [self.json objectForKey:@"daily"][@"data"]);
//    
//    DetailViewController *vc = segue.destinationViewController;
//    
//    vc.randomArray = dictionaryToPass;
//
//}

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
