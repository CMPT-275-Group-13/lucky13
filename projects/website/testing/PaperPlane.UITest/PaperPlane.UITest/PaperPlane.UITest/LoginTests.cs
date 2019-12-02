using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;



namespace PaperPlane.UITest
{
    public class LoginTests
    {
        IWebDriver driver;

        [SetUp]
        public void BeforeEachTest()
        {
            driver = new ChromeDriver();
            driver.Navigate().GoToUrl("http://cmpt275-paperplane.cjinng.com/");
        }
        
        [Test]
        public void ValidateLogin()
        {
            Thread.Sleep(5000);
            driver.FindElement(By.Id("email")).SendKeys("qa.test1@paperplane.com");
            driver.FindElement(By.Id("password")).SendKeys("t3st0rder");
            driver.FindElement(By.Id("login-btn")).Click();

            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(5);            
            var results = driver.FindElement(By.XPath("/html/body/div[1]/div"));

            Assert.IsTrue(results.Displayed);
        }

        [TearDown]
        public void CleanUp()
        {
            if(driver != null)
            {
                driver.Quit();
            }
        }

    }
    
}
