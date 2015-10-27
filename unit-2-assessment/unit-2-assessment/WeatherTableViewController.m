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
#import "DetailViewController.h"
#import "EntryViewController.h"

@interface WeatherTableViewController ()  <UITableViewDataSource>

@property (nonatomic) NSMutableArray *resultsArray;
//@property (nonatomic) NSMutableArray *timeArray;
//@property (nonatomic) NSMutableArray *imageArray;
//@property (nonatomic) NSMutableArray *rangeArray;
//@property (nonatomic) NSMutableArray *summaryArray;
//@property (nonatomic) NSMutableArray *rainArray;
//@property (nonatomic) NSMutableArray *humidityArray;
//@property (nonatomic) NSMutableArray *windArray;
@property (nonatomic) NSString *longitude;
@property (nonatomic) NSString *latitude;

//comment

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tableView.dataSource = self;
    
    self.resultsArray = [[NSMutableArray alloc] init];

}
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
-(void)fetch{
    
    [self.resultsArray removeAllObjects];
    
    NSString *latitude = [[NSUserDefaults standardUserDefaults] objectForKey:@"Latitude"];
    NSString *longitude = [[NSUserDefaults standardUserDefaults] objectForKey:@"Longitude"];
    NSString *url = [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/%@,%@", latitude, longitude ];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *json = (NSDictionary *) responseObject;

        
//                NSLog(@"JSON: %@", json);
        
        
        
//        NSLog(@"%@", [json objectForKey:@"daily"][@"data"]);
        
//        NSLog(@"%@", [json objectForKey:@"data"][@"time"]);
        
        


        //array to pass
                NSArray *results = [json objectForKey:@"daily"][@"data"];
        
        for (NSDictionary *result in results){
            
            WeatherData *obj = [[WeatherData alloc] initWithSecondsSince1970:[result[@"time"] doubleValue]];
            obj.summary = result[@"summary"];
            obj.maxTemp = [result[@"temperatureMax"] doubleValue];
            obj.minTemp = [result[@"temperatureMin"] doubleValue];
            obj.weatherImage = result[@"icon"];
            obj.rain = [result[@"precipProbability"] doubleValue];
            obj.humidity = [result[@"humidity"] doubleValue];
            obj.wind = [result[@"windSpeed"] doubleValue];
            
            [self.resultsArray addObject:obj];
            
        }
        
        
//
//                self.resultsArray = [[NSMutableArray alloc] init];
//
//                for (NSDictionary *result in results) {
//                
//                    WeatherData *leftLabelObj = [[WeatherData alloc]init];
//                    
//                    leftLabelObj.time = [result objectForKey:@"time"];
//                    
//                    NSLog(@"%@", leftLabelObj.time);
//                    
//                    [self.resultsArray addObject:leftLabelObj];
//
//
//                }
//        
//        self.rangeArray = [[NSMutableArray alloc] init];
//
//        
//        for (NSDictionary *resultTwo in results) {
//            
//            WeatherData *rightRangeLabel = [[WeatherData alloc]init];
//            
//            rightRangeLabel.maxTemp = [resultTwo objectForKey:@"temperatureMin"];
//            
//            rightRangeLabel.minTemp = [resultTwo objectForKey:@"temperatureMax"];
//
//            
//            NSLog(@"%@", rightRangeLabel.maxTemp);
//            NSLog(@"%@", rightRangeLabel.minTemp);
//
//            
//            [self.rangeArray addObject:rightRangeLabel];
//            
//            
//        }
        
//        self.imageArray = [[NSMutableArray alloc] init];

        
//        for (NSDictionary *resultThree in results) {
//            
//            WeatherData *weatherImageView = [[WeatherData alloc]init];
//            
//            weatherImageView.weatherImage = [resultThree objectForKey:@"icon"];
//            
//            NSLog(@"%@", weatherImageView.weatherImage);
//            
//            [self.imageArray addObject:weatherImageView];
//            
//            
//        }
//        
//        self.summaryArray = [[NSMutableArray alloc] init];
//
//        
//        for (NSDictionary *resultFour in results) {
//            
//            WeatherData *summaryObj = [[WeatherData alloc]init];
//            
//            summaryObj.summary = [resultFour objectForKey:@"summary"];
//            
//            NSLog(@"%@", summaryObj.summary);
//            
//            [self.summaryArray addObject:summaryObj];
//            
//            
//        }
//        
//        self.rainArray = [[NSMutableArray alloc] init];
//
//        
//        for (NSDictionary *resultFive in results) {
//            
//            WeatherData *rainObj = [[WeatherData alloc]init];
//            
//            rainObj.rain = [resultFive objectForKey:@"precipProbability"];
//            
//            NSLog(@"%@", rainObj.rain);
//            
//            [self.rainArray addObject:rainObj];
//            
//            
//        }
//        
//        self.humidityArray = [[NSMutableArray alloc] init];
//
//        
//        for (NSDictionary *resultSix in results) {
//            
//            WeatherData *humidityObj = [[WeatherData alloc]init];
//            
//            humidityObj.humidity = [resultSix objectForKey:@"humidity"];
//            
//            NSLog(@"%@", humidityObj.humidity);
//            
//            [self.humidityArray addObject:humidityObj];
//            
//            
//        }
//        
//        self.windArray = [[NSMutableArray alloc] init];
//
//        
//        for (NSDictionary *resultSeven in results) {
//            
//            WeatherData *windObj = [[WeatherData alloc]init];
//            
//            windObj.wind = [resultSeven objectForKey:@"windSpeed"];
//            
//            NSLog(@"%@", windObj.wind);
//            
//            [self.windArray addObject:windObj];
        
            
//        }
        
        [self.tableView reloadData];

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

-(void)viewWillAppear:(BOOL)animated{
    self.longitude = [[NSUserDefaults standardUserDefaults] stringForKey:@"longitude"];
    self.latitude = [[NSUserDefaults standardUserDefaults] stringForKey:@"latitude"];
    
    [self fetch];
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
    
//    WeatherData * result = [self.resultsArray objectAtIndex:indexPath.row];
//    WeatherData * resultTwo = [self.rangeArray objectAtIndex:indexPath.row];
//    WeatherData * resultThree = [self.imageArray objectAtIndex:indexPath.row];
//    
//    NSString *string = [NSString stringWithFormat:@"%@", result.time];
//    NSString *stringTwo = [NSString stringWithFormat:@"%@ - %@",resultTwo.minTemp, resultTwo.maxTemp];
//
//    customCell.leftTimeLabel.text = string;
//    customCell.rightRangeLabel.text = stringTwo;
////    customCell.weatherImageView.image = [resultThree imageNamed: resultThree.string];
//    
//    NSString *imageName = resultThree.weatherImage;
//    customCell.imageView.image = [UIImage imageNamed:imageName];
    
    customCell.weatherImageView.image = [UIImage imageNamed:[self.resultsArray[indexPath.row] weatherImage]];
    customCell.rightRangeLabel.text = [NSString stringWithFormat:@"%.2f - %.2f",
                           [self.resultsArray[indexPath.row] minTemp],
                           [self.resultsArray[indexPath.row] maxTemp]];
    customCell.leftTimeLabel.text = [self.resultsArray[indexPath.row] dayOfWeek];

    return customCell;
}




- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"detail"]){
    
    NSIndexPath *indexpath = [self.tableView indexPathForSelectedRow];
    
//    NSArray *arrayToPass = [self.imageArray objectAtIndex:indexpath.row];
    
    DetailViewController *vc = segue.destinationViewController;
    
    vc.image = [self.resultsArray[indexpath.row] weatherImage];
    vc.humidity = [self.resultsArray[indexpath.row] humidity];
    vc.rain = [self.resultsArray[indexpath.row] rain];
    vc.wind = [self.resultsArray[indexpath.row] wind];
    vc.summary = [self.resultsArray[indexpath.row] summary];
    
}else if ([segue.identifier isEqualToString:@"location"]) {
    
}

//    vc.passedImgeArray = arrayToPass;
//    
//    
//    //this is not an array, it is one item from an array
//    NSArray *arrayToPassTwo = [self.summaryArray objectAtIndex:indexpath.row];
//    
////    DetailViewController *vcTwo = segue.destinationViewController;
//    
//    vc.passedTextArray = arrayToPassTwo;
//    
//    //third array
//    NSArray *arrayToPassThree = [self.rainArray objectAtIndex:indexpath.row];
//    
////    DetailViewController *vcThree = segue.destinationViewController;
//    
//    vc.passedRainArray = arrayToPassThree;
//
//    //fourth array
//    NSArray *arrayToPassFour = [self.humidityArray objectAtIndex:indexpath.row];
//    
////    DetailViewController *vcFour = segue.destinationViewController;
//    
//    vc.passedHumidityArray = arrayToPassFour;
//
//    
//    //fifth array
//    NSArray *arrayToPassFive = [self.windArray objectAtIndex:indexpath.row];
//    
////    DetailViewController *vcFive = segue.destinationViewController;
//    
//    vc.passedWindArray = arrayToPassFive;
    

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
