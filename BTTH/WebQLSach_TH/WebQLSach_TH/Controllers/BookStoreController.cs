using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebQLSach_TH.Models;


namespace WebQLSach_TH.Controllers
{
    public class BookStoreController : Controller
    {
        QLBanSachEntitiesN1 data = new QLBanSachEntitiesN1();
        // GET: BookStore
        private List<SACH> Laysachmoi(int count)
        {
            // Sap xep sach giam dan theo ngay cap nhat
            return data.SACHes.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }
        // GET: BookStore
        public ActionResult Index()
        {
            var sachmoi = Laysachmoi(5);
            return View(sachmoi);
        }

        public ActionResult ChuDe()
        {
            var chude = from cd in data.CHUDEs select cd;
            return PartialView(chude);
        }

        public ActionResult NhaXuatBan()
        {
            var nhaxb = from cd in data.NHAXUATBANs select cd;
            return PartialView(nhaxb);
        }

        public ActionResult SPTheoChuDe(int id)
        {
            var sach = from s in data.SACHes where s.MaCD == id select s;
            return View(sach);
        }

        public ActionResult SPTheoNXB(int id)
        {
            var sach = from s in data.SACHes where s.MaNXB == id select s;
            return View(sach);
        }
    }
}