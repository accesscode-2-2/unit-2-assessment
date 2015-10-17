//
//  WeatherDataTableViewController.m
//  unit-2-assessment
//
//  Created by Mesfin Bekele Mekonnen on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "WeatherDataTableViewController.h"
#import "WeatherDataDetailViewController.h"
#import "EnterLatLongViewController.h"
#import "CustomWeatherDataTableViewCell.h"
#import "EnterLatLongViewController.h"
@interface WeatherDataTableViewController ()<EnterLatLongDelegate>

@property (nonatomic) NSString *latitude;
@property (nonatomic) NSString *longitude;
@property (nonatomic) NSArray *data;

@end

@implementation WeatherDataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *cellNib = [UINib nibWithNibName:@"CustomWeatherDataTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"CustomCellID"];
    
    [self fetchWeatherData];
}

-(void)fetchWeatherData{
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    NSDictionary *latitudeLongitudeDict = [[NSUserDefaults standardUserDefaults] objectForKey:@"dict"];
    
    NSString *latitude = [latitudeLongitudeDict objectForKey:@"latitude"];
    NSString *longitude = [latitudeLongitudeDict objectForKey:@"longitude"];
    
    NSString *url;
    if(latitude && longitude && latitude.length && longitude.length)
    {
        url =[NSString stringWithFormat:@"https://api.forecast.io/forecast/95ac0e76481513d58b808d31fba3a227/%@,%@",latitude,longitude];
    }
    else
    {
        url = [NSString stringWithFormat:@"https://api.forecast.io/forecast/95ac0e76481513d58b808d31fba3a227/%@,%@",self.latitude,self.longitude];
    }
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        
        NSDictionary *daily = responseObject[@"daily"];
        NSArray *data = daily[@"data"];
        self.data = data;
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error.localizedDescription);
    }];
}

-(NSString *)stringFromTimeInterval:(NSTimeInterval)time{
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    
    return dateName;
    
}

#pragma mark
#pragma EnterLatLong Delegate Method

- (void)enteredLatLong:(EnterLatLongViewController *)evc latitude:(NSString *)latitude longitude:(NSString *)longitude{
    self.latitude = latitude;
    self.longitude = longitude;
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.data.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherDataCell" forIndexPath:indexPath];
    //    NSDictionary *dict = self.data[indexPath.row];
    //    NSTimeInterval timeInterval = [dict[@"time"] doubleValue];
    //    NSString *dateName = [self stringFromTimeInterval:timeInterval];
    //    NSString *minTemp = [NSString stringWithFormat:@"%@ -",dict[@"temperatureMin"]];
    //    NSString *maxTemp = [NSString stringWithFormat:@"%@",dict[@"temperatureMax"] ];
    //    NSString *tempInfo = [minTemp stringByAppendingString:maxTemp];
    ////
    //    cell.textLabel.text = dateName;
    //    cell.detailTextLabel.text = tempInfo;
    //    cell.imageView.image = [UIImage imageNamed:dict[@"icon"]];
    //    return cell;
    CustomWeatherDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellID" forIndexPath:indexPath];
    
    NSDictionary *dict = self.data[indexPath.row];
    NSTimeInterval timeInterval = [dict[@"time"] doubleValue];
    NSString *dateName = [self stringFromTimeInterval:timeInterval];
    
    NSString *minTemp = [NSString stringWithFormat:@"%@",dict[@"temperatureMin"]];
    NSString *minTempShort = [NSString stringWithFormat:@"%.0f",[minTemp doubleValue]];
    
    NSString *minTempWithDash = [NSString stringWithFormat:@"%@ - ",minTempShort];
    
    
    
    NSString *maxTemp = [NSString stringWithFormat:@"%@",dict[@"temperatureMax"] ];
    NSString *maxTempShort = [NSString stringWithFormat:@"%.0f",[maxTemp doubleValue]];
    
    
    NSString *tempInfo = [minTempWithDash stringByAppendingString:maxTempShort];
    
    cell.dateLabel.text = dateName;
    cell.tempInfoLabel.text = tempInfo;
    cell.iconImageView.image = [UIImage imageNamed:dict[@"icon"]];
    
    return cell;
}

-(void)viewWillAppear:(BOOL)animated{
    [self fetchWeatherData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WeatherDataDetailViewController *dvc = (WeatherDataDetailViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"weatherDataDetailViewID"];
    
    dvc.dataDictionary = self.data[indexPath.row];
    
    [self.navigationController pushViewController:dvc animated:YES];
    
}

- (IBAction)settingsButtonTapped:(UIBarButtonItem *)sender {
    UINavigationController *nvc = (UINavigationController *)[self.storyboard instantiateViewControllerWithIdentifier:@"navigationSegueID"];
    
    EnterLatLongViewController *ellvc = (EnterLatLongViewController *)nvc.topViewController;
    
    ellvc.delegate = self;
    [self presentViewController:nvc animated:YES completion:nil];
}


@end
