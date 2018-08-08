/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dados;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author t7249320
 */
public class Sistema {

    private Integer id;
    private String sistema;

    public List<String> getObs() {
        return obs;
    }

    public void setObs(List<String> obs) {
        this.obs = obs;
    }
    private String ocorrencia;
    private String Observações;
    private String abertura;
    private String fechamento;
    private String horaI;
    private String horaF;
    private String volume;

    public String getHoraI() {
        return horaI;
    }

    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }

    public void setHoraI(String horaI) {
        this.horaI = horaI;
    }

    public String getHoraF() {
        return horaF;
    }

    public void setHoraF(String horaF) {
        this.horaF = horaF;
    }
    private String status;
    private int chamado;
    private List<String> obs = new ArrayList<>();

    public String getSistema() {
        return sistema;
    }

    public void setSistema(String sistema) {
        this.sistema = sistema;
    }

    public int getChamado() {
        return chamado;
    }

    public void setChamado(int chamado) {
        this.chamado = chamado;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
  

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

    public String getAbertura() {
        return abertura;
    }

    public void setAbertura(String abertura) {
        this.abertura = abertura;
    }

    public String getFechamento() {
        return fechamento;
    }

    public void setFechamento(String fechamento) {
        this.fechamento = fechamento;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
