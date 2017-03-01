//
//  AddNewViewController.m
//  Every do it again
//
//  Created by Callum Davies on 2017-03-01.
//  Copyright © 2017 Callum Davies. All rights reserved.
//

#import "AddNewViewController.h"

@interface AddNewViewController ()
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@end

@implementation AddNewViewController

- (IBAction)makeNewPressed:(UIButton *)sender {
    
    NSEntityDescription *newTodoEntity = [NSEntityDescription entityForName:@"Todo" inManagedObjectContext:self.managedObjectContext];
    NSManagedObject *newTodoObject = [[NSManagedObject alloc] initWithEntity:newTodoEntity insertIntoManagedObjectContext:self.managedObjectContext];
    
    [newTodoObject setValue:[NSNumber numberWithInt:[self.priorityTextField.text intValue]] forKey:@"priorityNumber"];
    [newTodoObject setValue:self.titleTextField.text forKey:@"title"];
    [newTodoObject setValue:self.descriptionTextView.text forKey:@"todoDescription"];

    [self.managedObjectContext save:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
