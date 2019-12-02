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
            driver.Navigate().GoToUrl("http://localhost/lucky13/projects/website/src/");
        }
        
        [Test]
        public void ValidateSearch()
        {
            
            SharedMethods.Login(driver);
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(5);
            driver.FindElement(By.XPath("/html/body/div[1]/div"));

            //go to search page
            driver.FindElement(By.Id("btnSearch")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);
            driver.FindElement(By.Id("inputSearch"));

            //search by name
            driver.FindElement(By.Id("inputSearch")).SendKeys("chelsie smith");
            driver.FindElement(By.Id("searchButton")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);

         
            var searchResults = driver.FindElement(By.XPath("/html/body/div[2]/div/form/div[3]/div/div/div"));

            Assert.IsTrue(searchResults.Displayed);

        }

        [Test]
        public void ValidateSearchProfile() {

            SharedMethods.Login(driver);
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(5);
            driver.FindElement(By.XPath("/html/body/div[1]/div"));

            //go to search page
            driver.FindElement(By.Id("btnSearch")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);
            driver.FindElement(By.Id("inputSearch"));

            //search by name
            driver.FindElement(By.Id("inputSearch")).SendKeys("chelsie smith");
            driver.FindElement(By.Id("searchButton")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);

            driver.FindElement(By.XPath("/html/body/div[2]/div/form/div[3]/div/div/div/p[2]/a")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);

            //in patient's profile page
            var results = driver.FindElement(By.Id("accordionExample"));


            Assert.IsTrue(results.Displayed);

     
        }

        [TearDown]
        public void CleanUp()
        {
            if (driver != null)
            {
                driver.Quit();
            }
        }

    }
}
