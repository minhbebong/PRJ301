package controller;

import core.MyCharacter;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author BachDuc
 */
public class Excercise5 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("Exercise5.html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String textarea = request.getParameter("textarea");
        String tongsokytu = request.getParameter("tongsokytu");
        String nhapvitri = request.getParameter("nhapvitri");
        String kytutuongung = request.getParameter("kytutuongung");
        String nhapchuoi = request.getParameter("nhapchuoi");
        String vitrituongung = request.getParameter("vitrituongung");
        String nhapvitritu = request.getParameter("nhapvitritu");
        String den = request.getParameter("den");
        String ketqua = request.getParameter("ketqua");
        tongsokytu = String.valueOf(new MyCharacter().totalchracter(textarea));
        String Notice = "";

        //DEMOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
//        if (nhapvitri.isEmpty()) {
//            Notice = "Ban Chua nhap vi tri";
//        }
        if (!nhapvitri.isEmpty()) {
            try {
                kytutuongung = String.valueOf(new MyCharacter().chracteratindex(Integer.valueOf(nhapvitri), textarea));
            } catch (Exception e) {
                Notice+="Nhap vi tri loi format\n";
            }
            
        }
        if (!nhapchuoi.isEmpty()) {
            if ((new MyCharacter().stringratindex(nhapchuoi, textarea) != -1)) {
                vitrituongung = String.valueOf(new MyCharacter().stringratindex(nhapchuoi, textarea));
            } else {
                vitrituongung = "";
            }
        }
        if (!(den.isEmpty()) && !(nhapvitri.isEmpty())) {
            try {
                Integer.parseInt(den);
            } catch (Exception e) {
                Notice += "nhap den sai format\n";
            }
            try {
                Integer.parseInt(nhapvitritu);
            } catch (Exception e) {
                Notice += "Nhap vi tri tu sai format\n";
            }
            try {
                ketqua = new MyCharacter().SubString(Integer.parseInt(nhapvitritu), Integer.parseInt(den), textarea);
            } catch (Exception e) {
            }
        }
        
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>\n"
                    + "<html>\n"
                    + "    <head>\n"
                    + "        <title>TODO supply a title</title>\n"
                    + "        <meta charset=\"UTF-8\">\n"
                    + "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                    + "    </head>\n"
                    + "    <body>\n"
                    + "        <div>Doi Tuong String</div>\n"
                    + "        <div>Nhap doan van</div>\n"
                    + "\n"
                    + "        <form action=\"Excercise5\" method=\"POST\">\n"
                    + "            <textarea name=\"textarea\" id=\"textarea\" cols=\"20\" rows=\"10\"  onchange=\"this.form.submit()\">" + textarea + "</textarea><br>\n"
                    + "            <div style=\"display: inline-block;\">Tong so ky tu</div><input type=\"text\" name=\"tongsokytu\" value=\"" + tongsokytu + "\" readonly><br>\n"
                    + "            <div style=\"display: inline-block;\">Nhap vi tri</div><input type=\"text\" name=\"nhapvitri\" value=\"" + nhapvitri + "\" onchange=\"this.form.submit()\" ><br>\n"
                    + "            <div style=\"display: inline-block;\">Ky tu tuong ung</div><input type=\"text\" name=\"kytutuongung\" value=\"" + kytutuongung + "\" readonly ><br>\n"
                    + "            <div style=\"display: inline-block;\">Nhap chuoi</div><input type=\"text\" name=\"nhapchuoi\" value=\"" + nhapchuoi + "\" onchange=\"this.form.submit()\"><br>\n"
                    + "            <div style=\"display: inline-block;\">Vi tri tuong ung</div><input  type=\"text\" name=\"vitrituongung\" value=\"" + vitrituongung + "\" readonly><br>\n"
                    + "            <div style=\"display: inline-block;\">nhap vi tri tu</div><input type=\"text\" name=\"nhapvitritu\" value=\"" + nhapvitritu + "\" onchange=\"this.form.submit()\" ><br>\n"
                    + "            <div style=\"display: inline-block;\">den</div><input type=\"text\" name=\"den\" value=\"" + den + "\" onchange=\"this.form.submit()\"><br>\n"
                    + "            <div style=\"display: inline-block;\">ket qua</div><input type=\"text\" name=\"ketqua\" value=\"" + ketqua + "\" readonly>\n"
                    + "        </form>\n"
                    + "\n"
                    + "            <input type=\"submit\" name=\"nhaplai\" value=\"Nhap Lai\" onclick=\"reset()\"/><br> \n"
                    + "\n"
                    + "\n"
                    + "\n"
                    + "        <script>\n"
                    + "            function reset() {\n"
                    + "                for (var i = 0, max = 8; i < max; i++) {\n"
                    + "                    document.getElementsByTagName(\"input\")[i].value = \"\";\n"
                    + "                }\n"
                    + "                     document.getElementById(\"textarea\").value =''"
                    + "            }\n"
                    + "\n"
                    + "        </script>\n"
                    + "    </body>\n"
                    + "</html>");
            out.println("<textarea name=\"textarea\" id=\"textarea\" cols=\"20\" rows=\"10\" readonly >" + Notice + "</textarea>");
        }
        

        //DEMOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
    }

}
