using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace PaperPlane.UITest
{
    class SearchTests
    {
        IWebDriver driver;

        [SetUp]
        public void BeforeEachTest()
        {
            driver = new ChromeDriver();
            driver.Navigate().GoToUrl("http://cmpt275-paperplane.cjinng.com/");
        }
        
        [Test]
        public void ValidateSearchByName()
        {
            
            SharedMethods.Login(driver);
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(5);
            driver.FindElement(By.XPath("/html/body/div[2]/ul"));
         
            //go to search page
            driver.FindElement(By.XPath("/html/body/div[2]/ul/li[3]/a")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);
            driver.FindElement(By.Id("search-filter-form")).FindElement(By.XPath("/form/div[1]/div/div[2]/div/label/h1"));

            //search by name
            driver.FindElement(By.Id("inputSearch")).SendKeys("chelsie smith");
            driver.FindElement(By.Id("buttonSearch")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);



        }
        
    }
}
