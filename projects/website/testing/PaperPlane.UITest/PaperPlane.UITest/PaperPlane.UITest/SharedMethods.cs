using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using OpenQA.Selenium;
using System.Threading;
using OpenQA.Selenium.Chrome;


namespace PaperPlane.UITest
{
    class SharedMethods
    {
        public static void Login(IWebDriver driver)
        {
            Thread.Sleep(5000);   
            driver.FindElement(By.Id("email")).SendKeys("qa.test1@paperplane.com");
            driver.FindElement(By.Id("password")).SendKeys("t3st0rder");
            driver.FindElement(By.Id("login-btn")).Click();
        }


        public static void Login(IWebDriver driver, string user, string password)
        {
            Thread.Sleep(5000);
            driver.FindElement(By.Id("email")).SendKeys(user);
            driver.FindElement(By.Id("password")).SendKeys(password);
            driver.FindElement(By.Id("login-btn")).Click();
        }

        public static void Wait(IWebDriver driver, int seconds)
        {
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(seconds);
        }
    }
}
