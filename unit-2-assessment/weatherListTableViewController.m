//
//  weatherListTableViewController.m
//  unit-2-assessment
//
//  Created by Bereket  on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "weatherListTableViewController.h"

@interface weatherListTableViewController ()

@end

@implementation weatherListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    self.weatherObjects = [[NSMutableArray alloc] init];
  
    
    if(self.forecasturl == nil){
        
        NSLog(@"self.forecasturl doesnt have a value yet");
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
    else{
    NSLog(@"%@", [NSString stringWithFormat:@"%@",self.forecasturl]);
        
        [self fetchForeCastData];
    }
    
    
        
}

-(void)fetchForeCastData{
    [APIManager GETRequestWithURL:self.forecasturl completionHandler:^(NSData* data, NSURLResponse* response, NSError* error){
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
         NSArray *results = [[json objectForKey:@"daily"] objectForKey:@"data"];
        
          NSLog(@"%@", results);
        
        for (NSDictionary* result in results) {
            DailyWeatherObject* weatherObject = [[DailyWeatherObject alloc] init];
            
            weatherObject.time = [NSString stringWithFormat:@"%@",[result objectForKey:@"time"]];
            weatherObject.windSpeed = [NSString stringWithFormat:@"%@",[result objectForKey:@"windSpeed"]];
            weatherObject.humidity = [NSString stringWithFormat:@"%@",[result objectForKey:@"humidity"]];
            weatherObject.summary = [result objectForKey:@"summary"];
            weatherObject.precipProbability = [NSString stringWithFormat:@"%@",[result objectForKey:@"precipProbability"]];
            weatherObject.temperatureMax = [NSString stringWithFormat:@"%@",[result objectForKey:@"temperatureMax"]];
            weatherObject.temperatureMin = [NSString stringWithFormat:@"%@",[result objectForKey:@"temperatureMin"]];
            weatherObject.weatherPic = [NSString stringWithFormat:@"%@", [result objectForKey:@"icon"]];
            
            
            [self.weatherObjects addObject:weatherObject];
            
            NSLog(@"%lu", (unsigned long)self.weatherObjects.count);
            
                   }
        
        
        [self.tableView reloadData];
        
        
    }];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weatherObjects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherDataCellIdentifier" forIndexPath:indexPath];
    
    cell.weatherObject = self.weatherObjects[indexPath.row];
    cell.dayOfTheWeekLabel.text= cell.weatherObject.time;
   
    cell.highLowTempLabel.text = [NSString stringWithFormat:@"%@/%@", cell.weatherObject.temperatureMax, cell.weatherObject.temperatureMin];
    
    cell.weatherPicLabel.image = [UIImage imageNamed:cell.weatherObject.weatherPic];
    
    
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




#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if (self.forecasturl == nil) {
        NSLog(@"try not to crash");
    }
   
    
    else{
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
        UINavigationController* navController= segue.destinationViewController;
        DetailWeatherViewController* viewController = navController.viewControllers[0];
        
        
        NSLog(@"Are we there yet?");
    
        DailyWeatherObject* weatherObject=  self.weatherObjects[indexPath.row];
        
        viewController.detailWeatherObject = weatherObject; 
        
        
        
    
    }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
