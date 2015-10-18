//
//  WeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Henna on 10/17/15.
//  Copyright (c) 2015 Henna. All rights reserved.
//

#import "WeatherTableViewController.h"
#import "APIManager.h"
#import "weatherObject.h"
#import "WeatherSummaryTableViewCell.h"
#import "WeatherDetailViewController.h"

@interface WeatherTableViewController ()
@property (nonatomic) NSString * latitude;
@property (nonatomic) NSString * longitude;
@property (nonatomic) NSMutableArray * weatherData;



@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.longitude = [[NSUserDefaults standardUserDefaults]  objectForKey:@"longitude"];
    self.latitude = [[NSUserDefaults standardUserDefaults]  objectForKey:@"latitude"];
    UINib *cellNib = [UINib nibWithNibName:@"CustomeTableViewCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:@"weatherSummaryIdentifier"];
    [self setUpNavigationBar];
    
    [self makeFSAPIRequestWithcallbackBlock:^{
        
        [self.tableView reloadData];
    }];

    
}

-(void) setUpNavigationBar{
    self.navigationItem.title = @"Weatherman";
    UIImage * settingsImage = [UIImage imageNamed:@"settings"];
    UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithImage:settingsImage style:UIBarButtonItemStylePlain target:self action:@selector(settingsClicked)];
    self.navigationItem.rightBarButtonItem = settingsButton;
}

-(void)settingsClicked{

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *ivc = [storyboard instantiateViewControllerWithIdentifier:@"WeatherInit"];
    [self.navigationController presentViewController:ivc animated:YES completion:nil];
    
}

- (void) makeFSAPIRequestWithcallbackBlock:(void(^)())block{
    
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/%@,%@", self.latitude, self.longitude];
    
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL   URLWithString:encodedString];
    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (data != nil) {
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.weatherData = [[NSMutableArray alloc]init];
            
            NSArray *results = [[json objectForKey:@"daily"] objectForKey:@"data"];
            
            
            for (NSDictionary *result in results) {
                weatherObject *obj = [[weatherObject alloc]init];
                obj.summary = [result objectForKey:@"summary"];
                obj.precipProbability = [result objectForKey:@"precipProbability"];
                obj.humidity = [result objectForKey:@"humidity"];
                obj.windSpeed = [result objectForKey:@"windSpeed"];
                obj.icon = [result objectForKey:@"icon"];
                obj.temperatureMax = [result objectForKey:@"temperatureMax"];
                obj.temperatureMin = [result objectForKey:@"temperatureMin"];
                NSNumber *time = [result objectForKey:@"time"];
                
                NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:[time doubleValue]];
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                [dateFormatter setDateFormat:@"EEEE"];
                NSString *dateName = [dateFormatter stringFromDate:date];
                obj.day = dateName;
                
                [self.weatherData addObject:obj];
            }
            block();
        }
        
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.weatherData.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeatherSummaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherSummaryIdentifier"];
    
    weatherObject *obj = [self.weatherData objectAtIndex: indexPath.row];
    
    cell.weekDayLabel.text = obj.day;
    cell.iconImage.image = [UIImage imageNamed: obj.icon];
    
    cell.minMaxLabel.text = [NSString stringWithFormat:@"%ld - %ld", (long)[obj.temperatureMin integerValue], (long)[obj.temperatureMax integerValue]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WeatherDetailViewController *ivc = [storyboard instantiateViewControllerWithIdentifier:@"WeatherDetailView"];
    ivc.weatherObj = [self.weatherData objectAtIndex:indexPath.row];

    
    [self.navigationController pushViewController:ivc animated:YES];

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
