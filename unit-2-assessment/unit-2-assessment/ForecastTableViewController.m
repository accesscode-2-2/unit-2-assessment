//
//  ForecastTableViewController.m
//  unit-2-assessment
//
//  Created by Natalia Estrella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastTableViewController.h"
#import "APIMomager.h"
#import "APIResults.h"


@interface ForecastTableViewController ()

@property (strong, nonatomic) NSMutableArray *searchResults;

@end

@implementation ForecastTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)makeFoursquareResquest:(NSString *)searchTerm
                callbacKBlock:(void(^)())block{
    
    //search term (from parameter)
    
//NSString *latString = [NSNumber stringValue];

    [super setValue:searchTerm forKey:@"27"];
    
    
    NSString *urlString= [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/"];
    //encoded URL
    

    NSString *encodingString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
        NSLog(@"%@", encodingString);
    
    //make the request
    //do somehting with the data
    
    NSURL *url = [NSURL URLWithString:encodingString];
    [APIMomager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (data !=nil) {
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:(NSData *)data options:0 error:nil];
            NSLog(@"%@", json);
            
            //            NSArray *results = [json objectForKey:@"results"];
            
            
            
            self.searchResults = [[NSMutableArray alloc] init];
            
            for (NSDictionary *weather in json[@"currently"]) {
                
                NSString *temp = weather[@"temperature"];
//                NSString *shortDescprition = weather[@"description"];
                
                
                APIResults *searchObject = [[APIResults alloc] init];
     
                searchObject.temp = temp;
//                searchObject.shortDescription = shortDescprition;
                
                [self.searchResults addObject:searchObject];
                
                
            }
            block ();
        }
        
        
    }];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    APIResults *currentResult = self.searchResults[indexPath.row];
    
        cell.textLabel.text = currentResult.temp;
    
//    NSNumber *tempNumber = currentResult.temp;
//    NSString *myNumberInString = [tempNumber stringValue];
//    cell.textLabel.text = myNumberInString;
    

    return cell;
}




@end
