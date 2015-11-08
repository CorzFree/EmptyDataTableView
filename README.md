# 让tableview不再空白
![enter image description here](https://github.com/CorzFree/EmptyDataTableView/blob/master/demo.gif?raw=true)

该demo是在[DZNEmptyDataSet](https://github.com/dzenbot/DZNEmptyDataSet)的基础上将代码抽取到EmptyDataManager.


----------

使用
--

    self.tableView.emptyDataSetDelegate = self.manager;
    self.tableView.emptyDataSetSource   = self.manager;
    
	- (EmptyDataManager *)manager{
	    if (!_manager) {
	        _manager = ({
	            EmptyDataManager *manager = [[EmptyDataManager alloc] initWithEmptyDataType:EmptyDataTypeCart buttonClickBlock:^{
	                [[[UIAlertView alloc] initWithTitle:@"message" message:@"click me" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil] show];
	            }];
	            manager;
	        });
	    }
	    return _manager;
    }
  
就这样，当然如果你想自己定制界面，请参考EmptyDataManager.m自己更换界面元素.
