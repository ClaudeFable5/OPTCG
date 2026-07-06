-- AUTO-GENERATED: EB02-006 / 야마토
-- rules_id=EB02-006 script_id=880000067 fingerprint=0f904e6dd99b18f17b79be6bc416f869811a04dfec6c2747ab3d8cb7deb399ef
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            selector={
              count=1,
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
          },
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            names={
              [[포트거스 D. 에이스]],
            },
            op=[[LEADER_HAS_TRAIT_ANY]],
            player=[[YOU]],
            traits={
              [[와노쿠니]],
            },
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 리더가 《와노쿠니》 특징을 가지거나 「포트거스 D. 에이스」인 경우, 자신의 리더 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다. 그 후, 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-006]],
    schema_version=1,
  })
end
