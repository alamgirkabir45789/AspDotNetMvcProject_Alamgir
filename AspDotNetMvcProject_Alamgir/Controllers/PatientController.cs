using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using AspDotNetMvcProject_Alamgir.Models;
using System.Data.Entity;

namespace AspDotNetMvcProject_Alamgir.Controllers
{
    public class PatientController : Controller
    {
        private AspDotNetMvcProject_AlamgirEntities2 db = new AspDotNetMvcProject_AlamgirEntities2();


        // GET: Patient
        public ActionResult Index()
        {
            return View(db.Patients.ToList());
        }



        // GET: Patient
        public ActionResult Create(Patient patient)
        {
            return View();
        }

        // POST: Patient
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreatePatient(Patient patient )
        {
            if (ModelState.IsValid)
            {

                db.Patients.Add(patient);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(patient);
        }

    }
}