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
    public class HomeTests
    {
        IWebDriver driver;

        [SetUp]
        public void BeforeEachTest()
        {
            driver = new ChromeDriver();
            driver.Navigate().GoToUrl("http://cmpt275-paperplane.cjinng.com/");
        }

        [Test]
        public void ValidateSignOut() {

            SharedMethods.Login(driver);
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(5);
            driver.FindElement(By.XPath("/html/body/div[1]/div"));

            //sign out
            driver.FindElement(By.XPath("/html/body/div[1]/div/div/h1[2]/button[2]")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(5);

            //validate goes back to login
            var btnLogin = driver.FindElement(By.Id("login-btn"));

            Assert.IsTrue(btnLogin.Displayed);
        }

        [Test]
        public void ValidateEditProfile()
        {
            SharedMethods.Login(driver);
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(5);
            driver.FindElement(By.XPath("/html/body/div[1]/div"));

            //edit profile
            driver.FindElement(By.XPath("/html/body/div[1]/div/div/h1[2]/button[1]")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(5);

            //validate goes back to edit page
            var btnEdit = driver.FindElement(By.Id("profile-change-btn"));

            Assert.IsTrue(btnEdit.Displayed);
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
