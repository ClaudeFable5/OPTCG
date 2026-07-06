-- AUTO-GENERATED: OP11-073 / 샬롯 링링
-- rules_id=OP11-073 script_id=880001407 fingerprint=c361bc4f131d03ab12e9756477983b32d14735ecc74847892a6625b68fb1865a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-073]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[빅 맘 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《빅 맘 해적단》 특징을 가진 경우, 이 캐릭터는 【속공】을 얻는다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            on_match={
              {
                amount=2000,
                duration=[[THIS_TURN]],
                op=[[MODIFY_POWER]],
                selector={
                  count=1,
                  kind=[[LEADER]],
                  mode=[[UP_TO]],
                  owner=[[YOU]],
                },
              },
            },
            op=[[DECLARE_COST_REVEAL]],
            player=[[YOU]],
            reveal_player=[[OPPONENT]],
          },
        },
        conditions={},
        costs={
          {
            count=5,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】두웅!!-5: 임의의 코스트를 선언하고, 상대의 덱 위에서 1장을 공개한다. 공개한 카드가 선언한 코스트와 같은 경우, 이번 턴 동안, 자신의 리더 1장까지의 파워 +2000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-073]],
    schema_version=1,
  })
end
