using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;

namespace Controller
{
    public class VL_Category
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion

        public List<VL_AREA> GetAllArea()
        {
            try
            {
                var list = db.VL_AREAs.Where(n => n.ARE_ACTIVE == 1).OrderByDescending(n => n.ARE_PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_CAPBAC> GetAllCapbac()
        {
            try
            {
                var list = db.VL_CAPBACs.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_HINHTHUCLAMVIEC> GetAllHinhthuclamviec()
        {
            try
            {
                var list = db.VL_HINHTHUCLAMVIECs.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_MUCLUONG> GetAllMucluong()
        {
            try
            {
                var list = db.VL_MUCLUONGs.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_KINHNGHIEM> GetAllKinhnghiem()
        {
            try
            {
                var list = db.VL_KINHNGHIEMs.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_TRINHDOHOCVAN> GetAllTrinhdohocvan()
        {
            try
            {
                var list = db.VL_TRINHDOHOCVANs.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_TRUONGTOTNGHIEP> GetAllTruongtotnghiep()
        {
            try
            {
                var list = db.VL_TRUONGTOTNGHIEPs.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_NGOAINGU> GetAllNgoaingu()
        {
            try
            {
                var list = db.VL_NGOAINGUs.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_TRINHDONGOAINGU> GetAllTrinhdoNgoaingu()
        {
            try
            {
                var list = db.VL_TRINHDONGOAINGUs.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_CITY> GetAllCity()
        {
            try
            {
                var list = db.VL_CITies.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_DOTUOI> GetAllDotuoi()
        {
            try
            {
                var list = db.VL_DOTUOIs.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_HINHTHUCNOPHOSO> GetAllHinhthucnophoso()
        {
            try
            {
                var list = db.VL_HINHTHUCNOPHOSOs.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<VL_QUYMOCONGTY> GetAllQuymo()
        {
            try
            {
                var list = db.VL_QUYMOCONGTies.Where(n => n.ACTIVE == 1).OrderByDescending(n => n.PRIORITY).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<ESHOP_CATEGORy> GetAllNganhnghe()//sap xep order -> Hot(mặc đinh)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_STATUS == 1 && n.CAT_RANK == 3 && n.CAT_TYPE == 2).OrderByDescending(n => n.CAT_ORDER).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<ESHOP_CATEGORy> GetAllNganhnghe_ABC()//sap xep name -> abc
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_STATUS == 1 && n.CAT_RANK == 3 && n.CAT_TYPE == 2).OrderBy(n => n.CAT_NAME).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
        public List<ESHOP_CATEGORy> GetAllNganhnghe_Group()//sap xep order -> group
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_STATUS == 1 && n.CAT_RANK == 2 && n.CAT_TYPE == 2).OrderBy(n => n.CAT_ORDER).ToList();
                return list;
            }
            catch
            {
                return null;
            }
        }
    }
}
