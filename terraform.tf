terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.71.0"
    }
  }
}

provider "azurerm" {
  cluster_suffix_name ="aks-<0_1>"
      default_pool_name ="default"
      default_pool_vm_count=1
      default_pool_vm_size="Standard_A2_v2"        
  # Configuration options
}

# # Créer les variables :
# provider "azurerm" {
#    cluster_suffix_name ="aks-<0_1>"
# # pas de valeur par défaut
# # le format du nom doit être "aks-<deux_digits>"
#    default_pool_name ="default"
# # valeur par défaut : "default"
# # ne doit contenir que des caractères alphanumériques

# # default_pool_vm_count
# # valeur par défaut : 1
# # doit avoir une valeur supérieure ou égale à 1
# default_pool_vm_count=1
# # default_pool_vm_size
# # valeur par défaut : "Standard_A2_v2"
# # doit avoir une valeur contenue dans cette liste :
# # "Standard_A2_v2"
# # "Standard_A4_v2"
# default_pool_vm_size="Standard_A2_v2"
# # Créer une variable locale avec votre trigramme
# # Les ressources
# # Créer les resources suivantes :

# # Un groupe de ressources (azurerm_resource_group)
# # nommé "<trigramme>-formation"
# # "francecentral" comme location

# # Un cluster kubernetes (azurerm_kubernetes_cluster)
# # nommé "<trigramme>-<cluster_name>"
# # le prefixe DNS suivra la même logique
# # un bloc "identity", de type "SystemAssigned"

# # Un pool supplémentaire (azurerm_kubernetes_cluster_node_pool)
# # nommé "apps"
# # comprenant un seul noeud de type "Standard_A2_v2"

# # Un déploiement d'application basé sur Helm (helm_release), en utilisant le provider helm
# # nommé "wordpress"
# # chart : "wordpress"
# # repository : "https://charts.bitnami.com/bitnami"
# # namespace : "wordpress"
# # "recreate_pods" et "create_namespace" doivent être positionnés à true
# # Les sorties
# # Afficher les informations suivantes :

# # Un output nommé "kubeconfig" pour afficher l'attribut "kube_config_raw" du cluster


# # Test de la recette
# # S'assurer que les règles de formattage sont appliquées
# # Valider que la syntaxe est correcte
# # Réaliser un plan de d'exécution
# # Appliquer le plan pour créer les ressources
# # Exporter et utiliser les informations de connexion au cluster
# # terraform output -raw kubeconfig > ./kubeconfig
# # export KUBECONFIG=./kubeconfig
# # Valider le bon fonctionnement du cluster grâce à la commande "kubectl get nodes"
# # Récupérer les informations de connexion au service Wordpress en utilisant les commandes suivantes :
# # export SERVICE_IP=$(kubectl get svc --namespace wordpress wordpress --template "{{ range (index .status.loadBalancer.ingress 0) }}{{.}}{{ end }}")
# # echo "WordPress URL: http://$SERVICE_IP/"
# # echo "WordPress Admin URL: http://$SERVICE_IP/admin"
# # echo Username: user
# # echo Password: $(kubectl get secret --namespace wordpress wordpress -o jsonpath="{.data.wordpress-password}" | base64 --decode)
# # Supprimer les ressources
# }