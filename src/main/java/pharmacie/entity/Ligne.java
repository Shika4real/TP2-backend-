package pharmacie.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.Positive;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Getter @Setter @NoArgsConstructor @RequiredArgsConstructor @ToString
public class Ligne {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Setter(AccessLevel.NONE)
    private Integer id;

    @NonNull
    @Positive
    private Integer quantite;

    @ManyToOne(optional = false)
    @NonNull
    @JoinColumn(name = "COMMANDE_NUMERO")
    @ToString.Exclude
    private Commande commande;

    @ManyToOne(optional = false)
    @NonNull
    @JoinColumn(name = "MEDICAMENT_REFERENCE")
    @ToString.Exclude
    private Medicament medicament;

    /**
     * Méthodes utilitaires pour respecter la nomenclature UML (getProduit)
     * Lombok génère déjà getMedicament, ceci est un alias sémantique.
     */
    public Medicament getProduit() {
        return this.medicament;
    }
}