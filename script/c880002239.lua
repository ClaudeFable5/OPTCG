-- AUTO-GENERATED: OP14-074 / 모네
-- rules_id=OP14-074 script_id=880002239 fingerprint=e79d6c102d2519e663135800180cc3c8fa977fd4c246ac88306fd1ab32f9fe7b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-074]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[돈키호테 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《돈키호테 해적단》 특징을 가진 경우, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
          {
            count=2,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 2장 뽑고, 자신의 패 1장을 버린다. 그 후, 두웅!! 덱에서 두웅!!을 2장까지 레스트 상태로 추가한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-074]],
    schema_version=1,
  })
end
