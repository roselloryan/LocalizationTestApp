
#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *farewellLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;


@end

@implementation ViewController

#define NAVIGATION_BAR_TITLE NSLocalizedStringFromTable(@"NAVIGATION_BAR_TITLE", @"Title at top of first screen", @"FirstViewControllerTable");

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = NAVIGATION_BAR_TITLE;
    self.backgroundImageView.image = [UIImage imageNamed:@"sombreroKitten"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resetBackgroundAlpha) name:NSUserDefaultsDidChangeNotification object:nil];
}


-(void)resetBackgroundAlpha {
    
    NSNumber *kittenAlpha = [[NSUserDefaults standardUserDefaults]  valueForKey:@"Settings_Kitten_Alpha"];
    
    if (kittenAlpha) {
        self.backgroundImageView.alpha = [kittenAlpha floatValue];
    }
    else {
        self.backgroundImageView.alpha = 1.0;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
