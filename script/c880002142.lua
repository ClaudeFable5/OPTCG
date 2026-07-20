-- AUTO-GENERATED: EB03-039 / 울티
-- rules_id=EB03-039 script_id=880002142 fingerprint=ca3fe9b61f5ab2558a91f537a9e57055811c2cdd41dfe62e20216c7f2da1393a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-039]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_lte=6000,
              vanilla=true,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[백수 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《백수 해적단》 특징을 가진 경우, 카드를 1장 뽑고, 자신의 패 1장을 버린다. 그 후, 자신의 트래시에서 파워 6000 이하이고 원래 효과가 없는 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-039]],
    schema_version=1,
  })
end
