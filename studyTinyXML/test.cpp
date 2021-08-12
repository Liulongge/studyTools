
#include "tinyxml.h"
using namespace tinyxml;
using namespace std;
int selectXML(const char* xmlPath)
{
    XMLDocument doc;
    if(doc.LoadFile(xmlPath)!=0)
    {
        cout<<"load xml file failed"<<endl;
        return false;
    }
    XMLElement* root=doc.RootElement();
    XMLElement* userNode=root->FirstChildElement("User");
    while(userNode != NULL)
    {
        if( 0 == strncmp("liangbaikai",(userNode->Attribute("Name")),11))
        {
            cout << userNode->Attribute("Name") << endl;
            cout << userNode->Attribute("Password") << endl;
            cout << userNode->FirstChildElement("Age")->GetText() << endl;
            cout << userNode->FirstChildElement("Gender")->GetText() << endl;
            cout << userNode->FirstChildElement("Mobile")->GetText() << endl;
            cout << userNode->FirstChildElement("Email")->GetText() << endl;
            userNode = userNode->NextSiblingElement();
        }
        else
        {
            userNode = userNode->NextSiblingElement();
        }
    }
    return 0;
}
 
int main( int argc, const char ** argv )
{
    // /*创建*/
    // createXML("./xml/bbb.xml");
    // /*增*/
    // addXML1("./xml/bbb.xml");/*添加性别，号码，邮箱*/ /*再添加一个用户*/
    // addXML2("./xml/bbb.xml");/*在性别后面添加年龄，再添加一个号码*/
    // /*删*/
    // deleteXML("./xml/bbb.xml");/*删除第一个号码，删除第二个号码的属性*/
    // /*改*/
    // changeXML("./xml/bbb.xml");/*将liangbaikai的年龄改为10000岁，将wenbaikai的号码改为8888结尾*/
    // /*查*/
    // selectXML("./xml/bbb.xml");/*将liangbaikai的信息打印出来*/
    return 0;
}