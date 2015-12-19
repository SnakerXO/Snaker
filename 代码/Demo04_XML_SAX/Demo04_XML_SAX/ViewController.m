//
//  ViewController.m
//  Demo04_XML_SAX
//
//  Created by tarena on 15/11/14.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSXMLParserDelegate>
//xmlData
@property(nonatomic,strong)NSData *xmlData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *partyPath = [[NSBundle mainBundle]pathForResource:@"party" ofType:@"xml"];
    self.xmlData = [NSData dataWithContentsOfFile:partyPath];
    
    //1.创建NSXMLParser对象
    NSXMLParser *parser = [[NSXMLParser alloc]initWithData:self.xmlData];
    //2.设置代理
    parser.delegate = self;
    //3.执行解析任务
    [parser parse];
}

#pragma mark --- NSXMLParserDelegate
-(void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"文档开始解析");
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    NSLog(@"已经解析到元素:%@",elementName);
    NSLog(@"该元素的属性:%@",attributeDict);
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"%@",string);
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"当前元素解析的名字:%@",namespaceURI);
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"文档结束解析");
}
@end
