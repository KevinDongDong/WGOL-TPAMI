#!/bin/sh

cd ../exper/

python train_sst.py \
    --arch=vgg_sst \
    --epoch=100 \
    --dataset=cub \
    --img_dir=../data/CUB_200_2011/images \
    --train_list=../data/CUB_200_2011/list/train.txt \
    --num_classes=200 \
    --resume=False \
    --pretrained_model=vgg16.pth \
    --seed=0 \
    --onehot=False \
    --decay_point=80 \
    --in_norm=True \
    --ram_start=20 \
    --ra_loss_weight=0.5 \
    --ram_th_bg=0.1 \
    --ram_bg_fg_gap=0.2 \
    --scg_com \
    --scg_blocks=4,5 \
    --scg_fosc_th=0.2 \
    --scg_sosc_th=1 \
    --scg_so_weight=1 \
    --scg_order=2 \
    --use_tap=False \
    --tap_th=0.1 \
    --tap_start=0 \
    --snapshot_dir=../snapshots/vgg16_spa+sa_#t10 \
    --log_dir=../log/vgg16_spa+sa_#t10 \
    --batch_size=128 \
    --gpus=0,1,2,3 \
    --lr=0.001 \
    --sos_lr=0.01 \
    --sos_gt_seg=True \
    --sos_seg_method=BC \
    --sos_fg_th=0.2 \
    --sos_bg_th=0.2 \
    --sos_loss_weight=0.5 \
    --sos_start=0 \
    --sa_lr=0.001 \
    --sa_use_edge=True \
    --sa_edge_stage=4,5 \
    --sa_start=20 \
    --sa_head=4 \
    --sa_neu_num=512 \
    --watch_cam \
    --hinge_lr=0.00005 \
    --hinge_loss_weight=1 \
    --mode=spa+sa \
    --ram \

#    --rcst_lr=0.000005 \
#    --rcst_signal=ori \
#    --rcst_loss_weight=0.1 \
#    --rcst_start=10 \
#    --rcst_ratio=700 \
# mode = spa / sos / spa+sa / sos+sa / spa+hinge
# sos_gt_method = BCE / MSE_BCE / CE2D
# sos_seg = cam / scm / none