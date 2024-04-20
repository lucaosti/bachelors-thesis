[righe, colonne] = size(image);

% Strutture per occorrenze e parametri della curva
occorrenze = zeros(num_steps_c, num_steps_b);
valoreA = zeros(num_steps_c, num_steps_b);
valoreD = zeros(num_steps_c, num_steps_b);

% Parametri della curva
for a_idx = min_a:passo_a:max_a
    for d_idx = min_d:max_d
        % Calcolo tutte le y in funzione di x
        y = zeros(1,2*colonne+1);
        for x = -colonne:colonne
            y(x+colonne+1) = round(-d_idx*(((exp(a_idx*x))/(1+exp(a_idx*x)))-0.5));
        end
        % Provo la curva generata per ogni pixel
        for b_idx = 1:num_steps_b
            for c_idx = 1:num_steps_c
            
                contatore = 0;
            
                for x = 1:colonne
                    riga = c_idx+y(x-b_idx+colonne+1);
                    if riga > 0 && riga <= righe
                        if image(riga, x) == 0
                            contatore = contatore + 1;
                        end
                    end
                end
                
                if contatore > occorrenze(c_idx, b_idx)
                    occorrenze(c_idx, b_idx) = contatore;
                    valoreA(c_idx, b_idx) = a_idx;
                    valoreD(c_idx, b_idx) = d_idx;
                end
                
            end
        end
    end
end