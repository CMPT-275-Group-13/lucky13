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
    class RegisterTests
    {
        IWebDriver driver;

        [SetUp]
        public void BeforeEachTests()
        {
            driver = new ChromeDriver();
            driver.Navigate().GoToUrl("http://cmpt275-paperplane.cjinng.com/");
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
