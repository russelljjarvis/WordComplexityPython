FROM russelljarvis/science_accessibility_user:latest
RUN ls -ltr
#RUN du Examples
#RUN sudo rm -r ART_Corpus.tar
RUN sudo rm -r geckodriver.log
WORKDIR $HOME
RUN du ./Examples

RUN sudo rm -r ./Examples/.scrapecache
RUN sudo rm -r ./Examples/protected
RUN sudo rm -r ./Examples/protected2
RUN sudo rm -r ./Examples/results_dir/other
RUN sudo rm -r ./Examples/results_dir
RUN sudo rm -r ./Examples/.ipynb_checkpoints
# RUN sudo rm -f ./Examples/*.p
RUN ls ./Examples/traingDats.p
RUN sudo rm -f ./Examples/*.db
RUN sudo rm -f ./Examples/*.csv
RUN sudo rm -f ./Examples/*.log
RUN sudo rm -f ./Examples/*.png
RUN du ./Examples
RUN sudo chown -R jovyan .

WORKDIR ./Examples
RUN wget https://www.dropbox.com/s/3h12l5y2pn49c80/traingDats.p?dl=0
# RUN wget https://www.dropbox.com/s/crarli3772rf3lj/more_authors_results.p?dl=0
# RUN wget https://www.dropbox.com/s/x66zf52himmp5ox/benchmarks.p?dl=0
# USER root
WORKDIR $HOME
RUN sudo /opt/conda/bin/pip install .
RUN sudo /opt/conda/bin/pip install git+https://github.com/plotly/dash
RUN git clone https://github.com/hfwittmann/dash.git
# https://github.com/hfwittmann/dash/tree/master/dash-simple.git
# WORKDIR


RUN sudo /opt/conda/bin/pip install -r dash/dash-simple/requirements-simple.txt
WORKDIR $HOME
EXPOSE 80
RUN echo "pat this is example of forced re-evaluation"
ADD . .
RUN sudo chown -R jovyan .

RUN sudo /opt/conda/bin/pip install .
RUN python -c "import SComplexity"
RUN python -c "from SComplexity import t_analysis, utils, scrape"
RUN ls -ltr
RUN ls SComplexity/online_app_backend.py
RUN ls OnlineApp/enter_author_name.py
RUN cp OnlineApp/enter_author_name.py .
# ENTRYPOINT /bin/bash
# ENTRYPOINT ["python", "OnlineApp/dash-asynchronous.py"]
ENTRYPOINT ["python", "OnlineApp/app.py"]

