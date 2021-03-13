<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주묻는 질문</title>
</head>
<body>

<jsp:include page="../main/header.jsp" />

      
  <!-- 자주묻는 질문 Accordion-->
      <section class="section section-lg bg-default text-center">
        <div class="container">
          <div class="row row-50 justify-content-lg-center">
            <div class="col-lg-10 col-xl-8">
              <h3>자주묻는 질문</h3>
              <!-- Bootstrap collapse-->
              <div class="card-group card-group-custom card-group-corporate" id="accordion1" role="tablist" aria-multiselectable="false">
                <!-- Bootstrap panel-->
                <div class="card card-custom card-corporate">
                  <div class="card-heading" id="accordion1Heading1" role="tab">
                    <div class="card-title"><a role="button" data-toggle="collapse" data-parent="#accordion1" href="#accordion1Collapse1" aria-controls="accordion1Collapse1" aria-expanded="true">질문 1
                        <div class="card-arrow"></div></a>
                    </div>
                  </div>
                  <div class="collapse show" id="accordion1Collapse1" role="tabpanel" aria-labelledby="accordion1Heading1">
                    <div class="card-body"> 
                      <p>질문에 대한 답1</p>
                    </div>
                  </div>
                </div>
                <!-- Bootstrap panel-->
                <div class="card card-custom card-corporate">
                  <div class="card-heading" id="accordion1Heading2" role="tab">
                    <div class="card-title"><a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion1" href="#accordion1Collapse2" aria-controls="accordion1Collapse2">질문 2
                        <div class="card-arrow"> </div></a>
                    </div>
                  </div>
                  <div class="collapse" id="accordion1Collapse2" role="tabpanel" aria-labelledby="accordion1Heading2">
                    <div class="card-body"> 
                      <p>질문에 대한 답2</p>
                    </div>
                  </div>
                </div>
                <!-- Bootstrap panel-->
                <div class="card card-custom card-corporate">
                  <div class="card-heading" id="accordion1Heading3" role="tab">
                    <div class="card-title"><a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion1" href="#accordion1Collapse3" aria-controls="accordion1Collapse3">질문 3
                        <div class="card-arrow"> </div></a>
                    </div>
                  </div>
                  <div class="collapse" id="accordion1Collapse3" role="tabpanel" aria-labelledby="accordion1Heading3">
                    <div class="card-body"> 
                      <p>질문에 대한 답3</p>
                    </div>
                  </div>
                </div>
                <!-- Bootstrap panel-->
                <div class="card card-custom card-corporate">
                  <div class="card-heading" id="accordion1Heading4" role="tab">
                    <div class="card-title"><a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion1" href="#accordion1Collapse4" aria-controls="accordion1Collapse4">질문4
                        <div class="card-arrow"> </div></a>
                    </div>
                  </div>
                  <div class="collapse" id="accordion1Collapse4" role="tabpanel" aria-labelledby="accordion1Heading4">
                    <div class="card-body"> 
                      <p>질문에 대한 답4</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>



<jsp:include page="../main/footer.jsp" />

</body>
</html>
