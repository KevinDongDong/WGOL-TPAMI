#!/bin/sh

cd ../exper/

python train_sst.py \
    --arch=vgg_sst \
    --dataset=ilsvrc \
    --img_dir=../data/ILSVRC/img_train \
    --train_list=../data/ILSVRC/list/train_list.txt \
    --num_classes=1000 \
    --scg_com \
    --scg_blocks=4,5 \
    --scg_fosc_th=0.2 \
    --scg_sosc_th=1 \
    --ram_th_bg=0.1 \
    --ram_bg_fg_gap=0.2 \
    --sos_gt_seg=True \
    --sos_seg_method=TC \
    --sos_loss_method=BCE \
    --sa_use_edge=True \
    --sa_edge_stage=4,5 \
    --snapshot_dir=../snapshots/ilsvrc/vgg16_sos+sa_v3_wp_#46 \
    --log_dir=../log/ilsvrc/vgg16_sos+sa_v3_wp_#46 \
    --load_finetune=True \
    --pretrained_model=ilsvrc_epoch_20.pth.tar \
    --pretrained_model_dir=../snapshots/ilsvrc/vgg16_spa_#1 \
    --batch_size=64 \
    --gpus=0,1,2,3,4,5,6,7 \
    --epoch=20 \
    --warmup=True \
    --warmup_fun=gra \
    --decay_point=12,14 \
    --decay_module=bb,cls,sa\;bb,cls,sa \
    --lr=0.001 \
    --cls_lr=0.001 \
    --sos_lr=0.00005 \
    --sa_lr=0.005 \
    --spa_loss=True \
    --spa_loss_weight=0.001 \
    --spa_loss_start=3 \
    --ram \
    --ra_loss_weight=0.5 \
    --ram_start=3 \
    --sos_fg_th=0.2 \
    --sos_bg_th=0.1 \
    --sos_loss_weight=1 \
    --sos_start=0 \
    --sa_start=3 \
    --sa_head=8 \
    --sa_neu_num=512 \
    --watch_cam \
    --mode=sos+sa_v3 \

