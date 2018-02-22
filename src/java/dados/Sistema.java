/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dados;

/**
 *
 * @author t7249320
 */
public class Sistema {
    public Integer id;
    public String sitema;
    public String ocorrencia;
    public String Observações;

    public String getOcorrencia() {
        return ocorrencia;
    }

    public void setOcorrencia(String ocorrencia) {
        this.ocorrencia = ocorrencia;
    }

    public String getObservações() {
        return Observações;
    }

    public void setObservações(String Observações) {
        this.Observações = Observações;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSitema() {
        return sitema;
    }

    public void setSitema(String sitema) {
        this.sitema = sitema;
    }
    
}
