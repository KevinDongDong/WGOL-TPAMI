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
    --ram \
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
    --cls_or_hinge=cls \
    --hinge_norm=norm \
    --hinge_p=1 \
    --hinge_m=1 \
    --hinge_lr=0.00005 \
    --hinge_loss_weight=1 \
    --snapshot_dir=../snapshots/vgg16_sos_#11 \
    --log_dir=../log/vgg16_sos_#11 \
    --batch_size=64 \
    --gpus=0,1,2,3 \
    --lr=0.001 \
    --sos_lr=0.00005 \
    --sos_gt_seg=True \
    --sos_seg_method=TC \
    --sos_loss_method=BCE \
    --sos_fg_th=0.3 \
    --sos_bg_th=0.1 \
    --sos_loss_weight=0.5 \
    --sos_start=0 \
    --sa_lr=0.001 \
    --sa_use_edge=True \
    --sa_edge_stage=4,5 \
    --sa_start=20 \
    --sa_head=4 \
    --sa_neu_num=512 \
    --watch_cam \
    --mode=sos \

#    --rcst_lr=0.000005 \
#    --rcst_signal=ori \
#    --rcst_loss_weight=0.1 \
#    --rcst_start=10 \
#    --rcst_ratio=700 \
# mode = spa / sos / mc_sos / mc_sos+sa / spa+sa / sos+sa / spa+hinge
# sos_seg_method = TC / BC