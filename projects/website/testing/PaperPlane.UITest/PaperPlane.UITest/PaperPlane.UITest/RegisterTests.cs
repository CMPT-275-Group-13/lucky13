using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;

namespace PaperPlane.UITest
{
    class RegisterTests
    {
        IWebDriver driver;

        [SetUp]
        public void BeforeEachTests()
        {
            driver = new ChromeDriver();
            driver.Navigate().GoToUrl("http://cmpt275-paperplane.cjinng.com/");
        }

        [Test]
        public void ValidateRegister()
        {
            var loginForm = By.Id("loginForm");
            WebDriverWait wait = new WebDriverWait(driver, TimeSpan.FromSeconds(5));
            wait.Until(SeleniumExtras.WaitHelpers.ExpectedConditions.ElementIsVisible(loginForm));
            driver.FindElement(loginForm).FindElement(By.XPath("/div[4]/a)")).Click();

            //test if we can register account
            wait.Until(SeleniumExtras.WaitHelpers.ExpectedConditions.ElementIsVisible(By.Id("register-btn")));
            driver.FindElement(By.Id("email")).SendKeys("qa.test2@gmail.com");
            driver.FindElement(By.Id("password")).SendKeys("t3st0rder");
            driver.FindElement(By.Id("first-name")).SendKeys("QA");
            driver.FindElement(By.Id("last-name")).SendKeys("Test");

            wait.Until(SeleniumExtras.WaitHelpers.ExpectedConditions.ElementIsVisible(By.ClassName("jumbotron")));


        }

        [Test]
        public void ValidateRegister_Negative()
        {
            

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
