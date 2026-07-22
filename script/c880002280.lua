-- AUTO-GENERATED: OP14-115 / 린도우
-- rules_id=OP14-115 script_id=880002280 fingerprint=7e93a198ea71771bd74ac0305138e457933e85b12c80eade99250f0e20a0fe40
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-115]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[DEAL_DAMAGE]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[OPPONENT_TURN]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【상대의 턴 동안】【KO 시】자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다. 그 후, 자신은 1 대미지를 받는다.]],
        timings={
          [[ON_KO]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[구사 해적단]],
          },
        },
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《구사 해적단》 특징을 가진 경우, 이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-115]],
    schema_version=1,
  })
end
