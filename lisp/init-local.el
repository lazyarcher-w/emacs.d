;;; init-local.el --- archer's config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; English translation plug
(require 'insert-translated-name)
(setq insert-translated-name-translate-engine 'google)

(require 'org)
;; org
(setq org-directory "~/org")

;; org-agenda
(setq org-agenda-files '("~/org"))

;; Setting up org-capture
(setq org-default-notes-file (concat org-directory "/inbox.org.gpg"))

(maybe-require-package 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))




;; vterm
(maybe-require-package 'vterm)

;; epa-file
(require 'epa-file)
(epa-file-enable)

;; Include .org.gpg files in org-agenda
(unless (string-match-p "\\.gpg" org-agenda-file-regexp)
  (setq org-agenda-file-regexp
        (replace-regexp-in-string "\\\\\\.org" "\\\\.org\\\\(\\\\.gpg\\\\)?"
                                  org-agenda-file-regexp)))

;; ================================================

;; -----BEGIN PGP PUBLIC KEY BLOCK-----

;; mQINBF+7IY8BEACuxhayMhforiZ0rz+tHPJ1i1QPSKcNetVVvefaheL6pD09VTio
;; KPGAQmXn34lJCUAT+ZXB3/SEnzJx1gI2TemaHhMy/Cq40EIaxnRb+E5w1nVe/FUx
;; 3dBekwrQ5STIC1ZIWJacLPyw5ghNsBPKdnsKcMAscIBw6X1F8kwxR4FOAr8nwr5Y
;; pxMylHD8qXmnXFO1kMID2qcj5QkU0XBgwUheHwoteJBDbBifHu9vLukSZYjVvWl8
;; YArtT3p/r89l44rVpTcjV2C45HnpqZKmzCvigDZ/Wg5qX7rvuuHgIBrHcHYrcEd8
;; qE7xHYy7NUVfVDnt8EGBQizTzM+pb2R0ZTEq8uwmFnMhJRj8sXcYyuLMbsYGO4Hn
;; QxF+QZWVvpQceJeyaQ2pQmpSIgvZTkKa9YIo9jXwgY9ZPQGGpH/2w3uF2pFYrOUV
;; KuC8eir+0euLFGqjfwryehNWWGSsR4NbY35wJH/1ApHLSTio3XMKM0o+i0edtjpR
;; S+HDaMbDU2yX2z6cbKuXpE2YVWAL7ZO2TMAQD2jUG4xjt+6X64ehpk5aFPLsURlr
;; 8IESFcOw1BDxJ40JRheT4ERxlf6CoJv4KcVOm3KbtkSwktdDLiYu2qVNrapGjcbv
;; TMCyC8V9l9bYnYlQ4KM2NTEYlb+iAF/WPJ1CY0GuxqsGByS5LPjoRyAMlQARAQAB
;; tCJhcmNoZXIgPGxhenlhcmNoZXIud2FuZ0BnbWFpbC5jb20+iQJOBBMBCAA4FiEE
;; 3VvpCOzGzaR4sxYpbsn8nVJOQgcFAl+7IY8CGwMFCwkIBwIGFQoJCAsCBBYCAwEC
;; HgECF4AACgkQbsn8nVJOQgdOuw//QofjC73dEXBE0HcAK0y+E3X/D4YWHs4P04Ri
;; Fsj25I/mgVxBFaS3nLqahEAY0yBvFodtGRm3JXEyHFAjAOaul2yF9w0NzZe4W+ix
;; V6dfDHA8E4bb15eYnO05eTf1QJLcv+ngeRFJhWSorHxA0npvFbVOWC2RUu/hFMFq
;; vsF8gcY28y+7LfOZzrvGUgZTkGpwNXXi1uiEs2aetpAlp38yoY8Tack4s6fKXHH5
;; SrbAa94Ilo1lJiW9zACyqlxQ9LUhB3xOd9SDMd4S76wYywuotWHD1lZD5k+IGoyj
;; 94tdgx0HDyzizgN3qXjItdIR9U2lj8cbOYpHclbMhMTHz6X2xa5XBo3yFlc8b0+N
;; VfLioGk+tksJQ9v9qM8KIkevS2Wo52KdN8UEIEZusxi8YVRZeANaDLKPvkQjCgHx
;; 9B12wEc6YM7oK2uyfAD4qcgB3uWLmRvxYNqe9z8GT3IOV4Nv6yMYhnHVQQVQ05/g
;; efN/IudeBVV3NVCqRmsDqXbSuATxOO0iXqLeV7JtahgYPvzRJgyA+Snrzar4bdfE
;; q92R58tc/wowXj0TBOnA0NyvtwmBqPFBy0BQdWbcKAbWBf1rEm8P9EMAGZMfjaL1
;; 8bMZ/cNRtbF/+mkJYGAN7y00xK9SgoZfzvoqQ7dIiLSguuulO7w6vKDeIuyf77A5
;; PP50m+W5Ag0EX7shjwEQAM5+bGRa+q+qAlcnhVEMlnTJwsF2pm7nMpWvIZxO5SkJ
;; Q2PoVrZ86Xsk3Ec5uPoi841c8B8PL/iJMwKVFVxQLjifPRsBVxWT0Cj9p1x+2e6X
;; CzohG4MZziIafPfMgdmlVwjM9huGPRiev9vOc3lG25B2xVzS/T6OXw0gJgms8knG
;; 8MniuM3U/8CsjoGphDqYn3Cz+gY0ENpgkP0fb2XWfNWbPic+rjc82y+ZGyBpkHlI
;; krxLgEvqm5ybL1NZzakDVQqQtawAq3iCBdFz8ALfImXi+iRKnoT04w7D2Ag9QmsB
;; 9tw7jKUJiMUzM5ko07Xnjpps0lwiSp1smMUIL0Dsluau/nYf6OT6XhoLoulNnOoW
;; w7VO0cHKypqZBA1bYn9x4EbiNBUpjEqmgkg4S5R8rbaazT40S9PwkOjKIPcSDAyE
;; hgLUAyLJizzfELdW3foBfb+7PchoZJ8gKIVDsklMrup00x6yUXz9J9s9My04N1EV
;; RsOJsjppFR8FU0AE/DeFtOMunnxvoj0m2nRCRO4i7dkTojFwfiyFBRlE7k3/sJLa
;; UCOZbe1ucM9eqL1gF4BFpSm/Ta//BY38JHDQ1L22xjMs/5w/fSOWMVElyWqiXPMc
;; 3F1S7+QgcIHizVLw8V2eAZP1cy6uUebDMzLfuL+7QK/EZpIrYuzKXZxcstImf1Nr
;; ABEBAAGJAjYEGAEIACAWIQTdW+kI7MbNpHizFiluyfydUk5CBwUCX7shjwIbDAAK
;; CRBuyfydUk5CByCdD/9bVrGwbLDpqrFgKy6y6VIcAOGNz1aGjPVEvU2uNz20Y2nk
;; oWKsOdmB1JGnMUJbFm2NzJz6+EiBFuncu+hwrSa1bYvsmJmquK0c9xSXFmfC4J+1
;; ymRlkapvkLgscOybEhsioQXFzye797+1NEkobtW+FmPNclOvMdB8fzujGpD+teRj
;; VmXtZfQ7i5cLWi+jBsHbP374tqo0FAS2DqyztHGqAVPPHMBitCtNIuaM2Q+f36Vv
;; 7nff3zdsDZT4gn5nDUn7WJXmUQBCd0SuzGW6O+yV4bkOMNbAPUR1BM5X+7JE3jrt
;; FWZijXbXVgZqBTfifMdyldcDtqqdTfpSLNN7bHgEuVDW9JlqHfMpKYSpNa7V70yB
;; MVfJyk7Lyv/t3ds0OIFqrCTzDIRaI051T40BjPAFMUm0EUe3J/4jpCVOIH2Zxi3k
;; yVOGuFUm0MwNzUUhGw3NJ+bJmUF2FFJ3PG0TYbhndffd2EzhhHAFP51FAbL3GdU7
;; 8+laV825RH14i03vU80YOCpls2YKRV6ZrQWAag+13J6E9cEu1PSbQC+BBsl+t0oA
;; C7anLXvo3IYE32wGqt9x1QyQ7ooNNJznvXkMncCNeuVydaOhubkxgeyjMxn5WBya
;; vGL3ADgPfxmbHQ8/rtH27H3mNS8jumhbJieMupVWVSKN3QqPNAo2W2rN6rF0YA==
;; =iLtd
;; -----END PGP PUBLIC KEY BLOCK-----

;; gpg --import public_key.txt

;; fingerprint
;; DD5B E908 ECC6 CDA4 78B3  1629 6EC9 FC9D 524E 4207

;; ================================================

;; imenu
(global-set-key (kbd "M-s i") #'counsel-imenu)

;; icons-font
(require-package 'all-the-icons)
;; M-x all-the-icons-install-fonts
(setq flycheck-checker-error-threshold 1000)
(provide 'init-local)
;;; init-local.el ends here
